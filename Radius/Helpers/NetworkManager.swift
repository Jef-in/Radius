//
//  NetworkManager.swift
//  Radius
//
//  Created by Jefin on 28/07/22.
//

import Network

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let queue = DispatchQueue.global()
    private let monitor: NWPathMonitor
    public private(set) var isConnected: Bool = false
    
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
