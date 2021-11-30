//
//  Constant.swift
//  TruckMap
//
//  Created by Ankit Sharma on 26/12/21.
//

import Foundation

let kBaseURL = "https://api.mystral.in/tt/mobile/logistics/searchTrucks?auth-company=PCH&companyId=33&deactivated=false&key=g2qb5jvucg7j8skpu5q7ria0mu&q-expand=true&q-include=lastRunningState,lastWaypoint"

let kGoogleAPIKey = "AIzaSyBMCBifFBTf5M0MNz5qk8XZJSTH4mkN6xc"

enum NetworkError: Error {
    case unKnown
}

typealias Completion<T> = ((T?, Error?) -> Void)
