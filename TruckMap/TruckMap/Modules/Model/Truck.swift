//
//  Truck.swift
//  TruckMap
//
//  Created by Ankit Sharma on 28/11/21.
//

import Foundation

struct Truck: Codable {
    var id: Int
    var truckNumber: String?
    var lastWaypoint: LastWaypoint?
    var lastRunningState: LastRunningState?
}


struct LastWaypoint: Codable {
    var lat: Double?
    var lng: Double?
    var createTime: Int?
    var speed: Double?
    var ignitionOn: Bool?
}

struct LastRunningState: Codable {
    var stopStartTime: Int?
    var truckRunningState: Int?
}


struct APIResponse: Codable {
    var responseCode: ResponseCode
    var data: [Truck]
}


struct ResponseCode: Codable {
    var responseCode: Int
    var message: String?
}
