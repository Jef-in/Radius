//
//  FacilitiesController.swift
//  Radius
//
//  Created by Jefin on 28/07/22.
//

import UIKit

class FacilitiesController: UIViewController {
    @IBOutlet weak var facilitiesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
    }
    
    func initialSetup() {
        facilitiesTable.sectionHeaderTopPadding = 0
    }
}

extension FacilitiesController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FacilitiesCell", for: indexPath) as? FacilitiesCell else { return UITableViewCell() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        
        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.text = "Facility Type"
        label.font = .systemFont(ofSize: 18)
        label.textColor = UIColor(displayP3Red: 67.0, green: 95.0, blue: 220.0, alpha: 1.0)
        
        headerView.addSubview(label)
        headerView.backgroundColor = .systemBlue
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
