//
//  FacilitiesCell.swift
//  Radius
//
//  Created by Jefin on 28/07/22.
//

import UIKit

class FacilitiesCell: UITableViewCell {
    
    @IBOutlet weak var facilityNameLabel: UILabel!
    @IBOutlet weak var facilityImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(facility: Facilities, option: Options, exclusions: [Exclusions]) {
        facilityNameLabel.text = option.name
        facilityImageView.image = UIImage(named: option.icon ?? "")
        if exclusions.count != 0 {
            for exclusion in exclusions {
                if exclusion.facility_id == facility.facility_id && exclusion.options_id == option.id {
                    self.backgroundColor = .lightGray
                    self.isUserInteractionEnabled = false
                } else {
                    self.backgroundColor = .clear
                    self.isUserInteractionEnabled = true
                }
            }
        } else {
            self.backgroundColor = .clear
            self.isUserInteractionEnabled = true
        }
    }
}
