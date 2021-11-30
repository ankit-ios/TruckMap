//
//  Observable.swift
//  TruckMap
//
//  Created by Ankit Sharma on 26/12/21.
//

import Foundation

class Observable<T> {
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    func bindAndUpdate(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    var value: T {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.listener?(self.value)
            }
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
