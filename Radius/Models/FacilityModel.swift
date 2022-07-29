//
//  FacilityModel.swift
//  Radius
//
//  Created by Jefin on 28/07/22.
//

import Foundation

public class FacilityModel: Codable {
    var facilities : [Facilities]?
    var exclusions : [[Exclusions]]?
}

public class Facilities : Codable {
    var facility_id : String?
    var name : String?
    var options : [Options]?
}

public class Options : Codable {
    var name : String?
    var icon : String?
    var id : String?
}

public class Exclusions : Codable {
    var facility_id : String?
    var options_id : String?
}
