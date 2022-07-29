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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
