//
//  TimeConverter.swift
//  TruckMap
//
//  Created by Ankit Sharma on 29/11/21.
//

import Foundation

struct TimeConverter {
    
    static func conversionToTimestamp(myMilliseconds: Int) -> String {
        let epochTime = TimeInterval(myMilliseconds) / 1000
        let date = Date(timeIntervalSince1970: epochTime)
        return stringFromTime(interval: Date().timeIntervalSince(date))
    }
    
    static func stringFromTime(interval: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.day, .hour, .minute, .second]
        formatter.unitsStyle = .full
        formatter.maximumUnitCount = 1
        return formatter.string(from: interval)!
    }
    
    static func splitDuration(durationText: String) -> (time: Int, unit: String) {
        let duration = durationText.components(separatedBy: " ")
        let time = Int(duration[0]) ?? 0
        return(time, duration[1])
    }
    
    static func isError(time: Int, unit: String) -> Bool {
        return unit.contains("day") || (unit.contains("hour") && time >= 4)
    }
}
