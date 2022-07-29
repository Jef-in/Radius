//
//  MockFacilitiesViewModel.swift
//  Radius
//
//  Created by Jefin on 29/07/22.
//

import Combine
import Foundation

class MockFacilitiesViewModel: FacilitiesViewable {
    
    var isGetFacilitiesCalled = false
    var isCheckForExclusionsCalled = false
    var mockExclusion: [Exclusions]?
    var mockFacilities: FacilityModel?
    
    func getFacilities() -> AnyPublisher<FacilityModel?, Error> {
        isGetFacilitiesCalled = true
        return Just(mockFacilities)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func checkForExclusions(for facilityId: String, optionId: String, exclusions: [[Exclusions]]) -> [Exclusions] {
        isCheckForExclusionsCalled = true
       return []
    }
}
