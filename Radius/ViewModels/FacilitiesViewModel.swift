//
//  FacilitiesViewModel.swift
//  Radius
//
//  Created by Jefin on 29/07/22.
//

import Combine
import Foundation

protocol FacilitiesViewable {
    func getFacilities() -> AnyPublisher<FacilityModel?, Error>
}

class FacilitiesViewModel: FacilitiesViewable {
    
    private let facilitiesService: FacilitiesService
    
    init(facilitiesService: FacilitiesService) {
        self.facilitiesService = facilitiesService
    }
    
    func getFacilities() -> AnyPublisher<FacilityModel?, Error> {
        facilitiesService.getFacilities()
            .eraseToAnyPublisher()
    }
}
