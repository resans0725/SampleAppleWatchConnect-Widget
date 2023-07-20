//
//  WatchConnector.swift
//  AppleWatchConnect
//
//  Created by 永井涼 on 2023/05/05.
//

import Foundation
import SwiftUI
import WatchConnectivity

class WatchConnector: NSObject, ObservableObject, WCSessionDelegate {
    
    @Published var receivedMessage = "WATCH: 未受信"
    @Published var count = 0
    
    override init() {
        super.init()
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
    }
    
    func session(
        _ session: WCSession,
        activationDidCompleteWith activationState: WCSessionActivationState,
        error: Error?
    ) {
        print("activationDidCompleteWith state= \(activationState.rawValue)")
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("sessionDidBecomeInactive")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("sessionDidDeactivate")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        print("didReceiveMessage: \(message)")
        
        DispatchQueue.main.async {
            self.receivedMessage = "WATCH : \(message["WATCH_COUNT"] as! Int)"
            self.count = message["WATCH_COUNT"] as! Int
        }
    }
    
    func send() {
        if WCSession.default.isReachable {
            count += 1
            UserDefaults(suiteName: "group.com.count.widget")?.set(count, forKey: "count")
            WCSession.default.sendMessage(["PHONE_COUNT" : count], replyHandler: nil)
        }
    }
}
