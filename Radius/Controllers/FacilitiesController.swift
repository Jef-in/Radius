//
//  FacilitiesController.swift
//  Radius
//
//  Created by Jefin on 28/07/22.
//

import Combine
import UIKit

class FacilitiesController: UIViewController {
    @IBOutlet weak var facilitiesTable: UITableView!
    
    private let viewModel: FacilitiesViewModel
    private let networkManger: NetworkManager
    var subscriptions = Set<AnyCancellable>()
    var facilities: [Facilities]?
    var exclusion: [[Exclusions]]?
    
    init(viewModel: FacilitiesViewModel,
         networkManager: NetworkManager) {
        self.viewModel = viewModel
        self.networkManger = networkManager
        super.init()
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = FacilitiesViewModel(facilitiesService: FacilitiesService())
        self.networkManger = NetworkManager.shared
        self.networkManger.startMonitoring()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
    }
    
    func initialSetup() {
        facilitiesTable.sectionHeaderTopPadding = 0
        loadFacilities()
    }
    
    func loadFacilities() {
        if networkManger.isConnected {
            getFacilities()
        } else {
            
        }
    }
    
    func getFacilities() {
        viewModel.getFacilities().sink(receiveCompletion: {(completion) in
            
        }, receiveValue: { facilityModel in
            self.facilities = facilityModel.facilities
            self.exclusion = facilityModel.exclusions
            
            DispatchQueue.main.async {
                self.facilitiesTable.reloadData()
            }
        }).store(in: &subscriptions)
    }
}
// MARK: Tableview delgate and datasource methods
extension FacilitiesController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return facilities?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return facilities?[section].options?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RadiusConstants.facilitiesCellIdentifier, for: indexPath) as? FacilitiesCell else { return UITableViewCell() }
        cell.facilityNameLabel.text = facilities?[indexPath.section].options?[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        
        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.text = facilities?[section].name
        label.font = .systemFont(ofSize: 18)
        label.textColor = RadiusConstants.facilityTypeColor
        
        headerView.addSubview(label)
        headerView.backgroundColor = .systemBlue
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
