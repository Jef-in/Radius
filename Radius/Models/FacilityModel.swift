//
//  FacilityModel.swift
//  Radius
//
//  Created by Jefin on 28/07/22.
//

import Foundation

public class FacilityModel: Codable {
    let facilities : [Facilities]?
    let exclusions : [[Exclusions]]?
}

public class Facilities : Codable {
    let facility_id : String?
    let name : String?
    let options : [Options]?
}

public class Options : Codable {
    let name : String?
    let icon : String?
    let id : String?
}

public class Exclusions : Codable {
    let facility_id : String?
    let options_id : String?
}
