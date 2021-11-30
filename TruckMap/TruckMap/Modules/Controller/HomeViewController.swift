//
//  HomeViewController.swift
//  TruckMap
//
//  Created by Ankit Sharma on 26/11/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewSwitchButton: UIBarButtonItem!
    @IBOutlet private weak var mapView: UIView!
    @IBOutlet private weak var listView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        listView.isHidden = true
        barButtonSetup()
    }
    
    
    func barButtonSetup() {
        viewSwitchButton = UIBarButtonItem(title: "Map", style: .done, target: self, action: #selector(viewSwitchButtonTapped))
        self.navigationItem.rightBarButtonItem = viewSwitchButton
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc func viewSwitchButtonTapped() {
        let isMapViewShowing = viewSwitchButton.title == "Map"
        viewSwitchButton.title = isMapViewShowing ? "Map" : "List"
        mapView.isHidden = isMapViewShowing
        listView.isHidden = !isMapViewShowing
    }
}
