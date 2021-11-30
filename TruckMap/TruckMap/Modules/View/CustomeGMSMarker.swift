//
//  CustomeGMSMarker.swift
//  TruckMap
//
//  Created by Ankit Sharma on 30/11/21.
//

import UIKit
import GoogleMaps

final class CustomeGMSMarker: GMSMarker {
    
    lazy var imageView: UIImageView = {
        let markerImage = UIImage(named: "truckIcon")!
            .withRenderingMode(.alwaysTemplate)
        return UIImageView(image: markerImage)
    }()
    
    init(truck: Truck, position: CLLocationCoordinate2D) {
        super.init()
        imageView.tintColor = truckTintColor(for: truck)
        self.iconView = imageView
        self.position = position
    }
    
    private func truckTintColor(for truck: Truck) -> UIColor {
        let lastRunningState = truck.lastRunningState?.truckRunningState ?? 0
        let duration = TimeConverter.splitDuration(durationText: TimeConverter.conversionToTimestamp(myMilliseconds: truck.lastWaypoint?.createTime ?? 0))
        
        if TimeConverter.isError(time: duration.time, unit: duration.unit) {
            return .systemRed
        } else if lastRunningState == 0 {
            return (truck.lastWaypoint?.ignitionOn ?? false) ? .systemYellow : .systemBlue
        } else {
            return .systemGreen
        }
    }
}
