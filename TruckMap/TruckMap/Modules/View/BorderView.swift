//
//  BorderView.swift
//  TruckMap
//
//  Created by Ankit Sharma on 29/11/21.
//

import UIKit

@IBDesignable final class BorderView: UIView {
    
    enum State {
        case `default`, error
    }
    
    var state: State = .default {
        didSet { updateUI() }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func updateUI() {
        let isErrorState = (state == .error)
        layer.borderWidth = isErrorState ? 1 : 0.5
        layer.borderColor = (isErrorState ? UIColor.red : .systemGray).cgColor
        layer.cornerRadius = 20
        
        //shadow
        layer.shadowOffset = CGSize(width: 10, height: 10)
        layer.shadowRadius = 20
        layer.shadowOpacity = 0.2
    }
}

