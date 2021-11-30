//
//  TruckDetailsDataSourceViewModel.swift
//  TruckMap
//
//  Created by Ankit Sharma on 30/11/21.
//

import Foundation

final class TruckDetailsDataSourceViewModel {
    
    static let shared = TruckDetailsDataSourceViewModel()
    
    private init() {
        fetchTrucksDetails()
    }
    
    var truckList: Observable<[Truck]> = Observable([])
    var truckMap: Observable<[Truck]> = Observable([])

    
    func fetchTrucksDetails() {
        NetworkManager.fetchAllTruckDetails { [weak self] (trucks, error) in
            if let trucks = trucks {
                self?.truckList.value =  trucks
                self?.truckMap.value =  trucks
            }
        }
    }
}
