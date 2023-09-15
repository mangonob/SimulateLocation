//
//  ViewController.swift
//  SimulateLocation
//
//  Created by mangonob on 2023/9/15.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var lonLabel: UILabel!
    
    let defaultRegion = MKCoordinateRegion(center: .init(latitude: 22.547990410719006, longitude: 113.94235976008504), span: .init(latitudeDelta: 0.004, longitudeDelta: 0.004))
    let meilinRegion = MKCoordinateRegion(center: .init(latitude: 22.573216080521416, longitude: 114.0608951326087), span: .init(latitudeDelta: 0.004, longitudeDelta: 0.004))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mapView.delegate = self
        mapView.setRegion(defaultRegion, animated: true)
    }
    
    @IBAction func currentLocationAction(_ sender: Any) {
        mapView.setRegion(defaultRegion, animated: true)
    }
    
    @IBAction func toMeilinAction(_ sender: Any) {
        mapView.setRegion(meilinRegion, animated: true)
    }
    
    @IBAction func copyLatitude(_ sender: Any) {
        UIPasteboard.general.string = "\(mapView.region.center.latitude)"
    }
    
    @IBAction func copyLongitude(_ sender: Any) {
        UIPasteboard.general.string = "\(mapView.region.center.longitude)"
    }
    
    fileprivate func updateLabel(location: CLLocationCoordinate2D) {
        latLabel.text = "Lat: \(location.latitude)"
        lonLabel.text = "Lon: \(location.longitude)"
    }
}

extension ViewController: MKMapViewDelegate {
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        updateLabel(location: mapView.region.center)
    }
}

