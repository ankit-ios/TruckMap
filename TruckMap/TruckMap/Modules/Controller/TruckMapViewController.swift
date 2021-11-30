//
//  TruckMapViewController.swift
//  TruckMap
//
//  Created by Ankit Sharma on 28/11/21.
//

import UIKit
import GoogleMaps

class TruckMapViewController: UIViewController {
    
    @IBOutlet weak var googleMap: GMSMapView!
    private let datasource = TruckDetailsDataSourceViewModel.shared
    
    var trucks: [Truck] = [] {
        didSet {
            updateMap()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datasource.truckMap.bind { [weak self] trucks in
            self?.trucks = trucks
        }
    }
}

private extension TruckMapViewController {
    
    func updateMap() {
        trucks.forEach { mapSetup(truck: $0) }
    }
    
    func mapSetup(truck: Truck) {
        let latitude = truck.lastWaypoint?.lat ?? 0.0
        let longitude = truck.lastWaypoint?.lng ?? 0.0
        googleMap.camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 10.0)
        CustomeGMSMarker(truck: truck, position: googleMap.camera.target).map = googleMap
    }
}
