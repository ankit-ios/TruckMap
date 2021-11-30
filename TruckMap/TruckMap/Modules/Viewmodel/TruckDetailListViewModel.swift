//
//  TruckDetailListViewModel.swift
//  TruckMap
//
//  Created by Ankit Sharma on 29/11/21.
//

import Foundation

struct TruckDetailListViewModel {
    
    var truckNumber: String?
    var duration: String?
    var durationDescription: String?
    var status: String?
    var speed: String?
    var isError: Bool
    
    
    init(truck: Truck) {
        truckNumber = truck.truckNumber
        speed = String(describing: truck.lastWaypoint?.speed ?? 0)
        
        let stopStartTime = TimeConverter.conversionToTimestamp(myMilliseconds: truck.lastRunningState?.stopStartTime ?? 0)
        let currentStatus = (truck.lastRunningState?.truckRunningState == 0) ? "Stopped" : "Running"
        status = "\(currentStatus) since last \(stopStartTime)."
        
        let durationObj = TimeConverter.splitDuration(durationText: TimeConverter.conversionToTimestamp(myMilliseconds: truck.lastWaypoint?.createTime ?? 0))
        duration = "\(durationObj.time)"
        durationDescription = "\(durationObj.unit) ago."
        isError = TimeConverter.isError(time: durationObj.time, unit: durationObj.unit)
    }
}
