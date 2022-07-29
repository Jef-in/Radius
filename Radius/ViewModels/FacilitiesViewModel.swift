//
//  FacilitiesViewModel.swift
//  Radius
//
//  Created by Jefin on 29/07/22.
//

import Combine
import Foundation

protocol FacilitiesViewable {
    func getFacilities() -> AnyPublisher<[Facilities]?, Error>
    func getExclusion() -> AnyPublisher<[[Exclusions]]?, Error>
}

class FacilitiesViewModel: FacilitiesViewable {
    
    private let facilitiesService: FacilitiesService
    
    init(facilitiesService: FacilitiesService) {
        self.facilitiesService = facilitiesService
    }
    
    func getFacilities() -> AnyPublisher<[Facilities]?, Error> {
        facilitiesService.getFacilities()
            .map(\.facilities)
            .eraseToAnyPublisher()
    }
    
    func getExclusion() -> AnyPublisher<[[Exclusions]]?, Error> {
        facilitiesService.getFacilities()
            .map(\.exclusions)
            .eraseToAnyPublisher()
    }
}
