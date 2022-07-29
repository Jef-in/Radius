//
//  NetworkManager.swift
//  Radius
//
//  Created by Jefin on 28/07/22.
//

import Network

protocol NetworkManageable {
    func startMonitoring()
    func stopMonitoring()
    var isConnected: Bool { get
    }
}

final class NetworkManager: NetworkManageable {
    
    static let shared = NetworkManager()
    private let queue = DispatchQueue.global()
    private let monitor: NWPathMonitor
    public internal(set) var isConnected: Bool = false
    
    private init() {
        monitor = NWPathMonitor()
    }
    
    public func startMonitoring() {
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status == .satisfied
        }
    }
    
    public func stopMonitoring() {
        monitor.cancel()
    }
}
