//
//  MockFacilitiesService.swift
//  Radius
//
//  Created by Jefin on 29/07/22.
//

import Combine
import Foundation

class MockFacilitiesService: FacilitiesServiceable {
    var getFacilitiesCalled = false
    let error = NSError(domain: "test", code: 0, userInfo: nil)
    var response: FacilityModel?
    
    func getFacilities() -> AnyPublisher<FacilityModel?, Error> {
        getFacilitiesCalled = true
        
        return Just(response)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
