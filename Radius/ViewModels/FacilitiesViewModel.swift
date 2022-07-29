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
    func checkForExclusions(for facilityId: String, optionId: String, exclusions: [[Exclusions]]) -> [Exclusions]
}

class FacilitiesViewModel: FacilitiesViewable {
    
    private let facilitiesService: FacilitiesServiceable
    
    init(facilitiesService: FacilitiesServiceable) {
        self.facilitiesService = facilitiesService
    }
    
    func getFacilities() -> AnyPublisher<FacilityModel?, Error> {
        facilitiesService.getFacilities()
            .eraseToAnyPublisher()
    }
    
    func checkForExclusions(for facilityId: String, optionId: String, exclusions: [[Exclusions]]) -> [Exclusions] {
        var exclusionApplicable = [Exclusions]()
        for outerCollection in exclusions {
            for index in 0...outerCollection.count - 1 {
                if outerCollection[index].facility_id == facilityId && outerCollection[index].options_id == optionId {
                    index == 0 ? exclusionApplicable.append(outerCollection[1]) : exclusionApplicable.append(outerCollection[0])
                }
            }
        }
        return exclusionApplicable
    }
}
