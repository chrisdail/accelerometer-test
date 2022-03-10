//
//  AccelModel.swift
//  AccelTest
//
//  Created by Chris on 2021-01-11.
//

import Foundation
import SwiftUI
import CoreMotion

class AccelModel: ObservableObject {
    @Published var maxG = 0.0
    @Published var frequency = 0
    
    let motion = CMMotionManager()

    func start() {
        var lastTimestamp = 0.0
        var maxSeen = 0.0
        let queue = OperationQueue()
        motion.accelerometerUpdateInterval = 1 / 200.0
        motion.startAccelerometerUpdates(to: queue) { (data: CMAccelerometerData?, error: Error?) in
            if let data = data {
                if data.acceleration.y > maxSeen {
                    maxSeen = data.acceleration.y
                }
                let frequency = 1 / (data.timestamp - lastTimestamp)
                lastTimestamp = data.timestamp
                
                DispatchQueue.main.async {
                    self.maxG = maxSeen
                    self.frequency = Int(frequency)
                }
            }
        }
    }
}
