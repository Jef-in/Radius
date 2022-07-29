//
//  FacilitiesViewModelTests.swift
//  RadiusTests
//
//  Created by Jefin on 29/07/22.
//

import XCTest
@testable import Radius

class FacilitiesViewModelTests: XCTestCase {
    
    var subject: FacilitiesViewable!
    var mockFacilitiesService: MockFacilitiesService!
    
    override func setUp() {
        super.setUp()
        mockFacilitiesService = MockFacilitiesService()
        subject = FacilitiesViewModel(facilitiesService: mockFacilitiesService)
    }
    
    override func tearDown() {
        mockFacilitiesService = nil
        subject = nil
        super.tearDown()
    }
    
    func testWhenGetFacilitiesServiceIsCalledShouldCallGetFacilitiesService() {
        _ = subject.getFacilities()
        XCTAssertTrue(mockFacilitiesService.getFacilitiesCalled)
    }
}
