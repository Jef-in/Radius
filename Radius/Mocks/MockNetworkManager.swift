//
//  MockNetworkManager.swift
//  Radius
//
//  Created by Jefin on 29/07/22.
//

import Foundation

class MockNetworkManager: NetworkManageable {
    var isConnected: Bool = false
    
    var isStartMonitoringCalled = false
    var isStopMonitoringCalled = false
    
    func startMonitoring() {
        isStartMonitoringCalled = true
    }
    
    func stopMonitoring() {
        isStopMonitoringCalled = true
    }
}
