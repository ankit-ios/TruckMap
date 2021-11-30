//
//  TruckDetailsTableViewCell.swift
//  TruckMap
//
//  Created by Ankit Sharma on 29/11/21.
//

import UIKit

class TruckDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var borderView: BorderView!
    @IBOutlet private weak var truckNumberLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var durationDescriptionLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var speedLabel: UILabel!
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func updateUI(for viewModel: TruckDetailListViewModel) {
        truckNumberLabel.text = viewModel.truckNumber
        durationLabel.text = viewModel.duration ?? ""
        durationDescriptionLabel.text = viewModel.durationDescription ?? ""
        statusLabel.text = viewModel.status ?? ""
        speedLabel.text = viewModel.speed ?? ""
        borderView.state = viewModel.isError ? .error : .default
    }
}
