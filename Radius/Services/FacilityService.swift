//
//  FacilityService.swift
//  Radius
//
//  Created by Jefin on 28/07/22.
//

import Combine
import Foundation

public protocol FacilitiesServiceable {
    func getFacilities() -> AnyPublisher<FacilityModel, Error>
}

class FacilitiesService: FacilitiesServiceable {
    
    func getFacilities() -> AnyPublisher<FacilityModel, Error> {
        guard let url = URL(string: RadiusConstants.facilitiesEndPoint) else { preconditionFailure("Failed to fetch url") }
        let request = URLRequest(url: url)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: FacilityModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
