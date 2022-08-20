//
//  LocationModel.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 02/08/2022.
//

import Foundation
import UIKit
import CoreLocation

class LocationModel: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    @Published var authorisationStatus: CLAuthorizationStatus = .notDetermined
    @Published var addressDataModel: AddressDataModel?
    var locationModelProtocol: LocationModelProtocol?
    
    static func getAddressFromLatLon(pdblLatitude: Double, withLongitude pdblLongitude: Double, successModelBlock: @escaping SuccessModelBlock<AddressDataModel>) {
        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
        let ceo: CLGeocoder = CLGeocoder()
        center.latitude = pdblLatitude
        center.longitude = pdblLongitude

        let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)


        ceo.reverseGeocodeLocation(loc, completionHandler:
            {(placemarks, error) in
                if (error != nil)
                {
                    print("reverse geodcode fail: \(error!.localizedDescription)")
                }
                let pm = placemarks! as [CLPlacemark]

                if pm.count > 0 {
                    let pm = placemarks?[0]
                    var addressString : String = ""
                    if pm?.subLocality != nil {
                        addressString = addressString + (pm?.subLocality ?? "") + ", "
                    }
                    if pm?.thoroughfare != nil {
                        addressString = addressString + (pm?.thoroughfare ?? "") + ", "
                    }
                    if pm?.locality != nil {
                        addressString = addressString + (pm?.locality ?? "") + ", "
                    }
                    if pm?.country != nil {
                        addressString = addressString + (pm?.country ?? "")
                    }
                    /*if pm?.postalCode != nil {
                        addressString = addressString + (pm?.postalCode ?? "") + " "
                    }*/
                    
                    successModelBlock(AddressDataModel(countryName: pm?.country, countryCode: pm?.isoCountryCode, longitude: pdblLongitude, latitude: pdblLatitude, addressLine: addressString))
              }
        })
    }

    override init() {
        super.init()
        self.locationManager.delegate = self
    }

    public func requestAuthorisation(always: Bool = false) {
        if self.authorisationStatus == CLAuthorizationStatus.authorizedAlways
            || self.authorisationStatus == CLAuthorizationStatus.authorizedWhenInUse {
            
            locationManager.requestLocation()
            locationManager.startUpdatingLocation()
        }
        else {
            if always {
                locationManager.requestAlwaysAuthorization()
            } else {
                locationManager.requestWhenInUseAuthorization()
            }
        }
    }
}

extension LocationModel: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.authorisationStatus = status
        if status == CLAuthorizationStatus.authorizedAlways
            || status == CLAuthorizationStatus.authorizedWhenInUse {
            
            manager.requestLocation()
            manager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        guard let locValue: CLLocationCoordinate2D = locationManager.location?.coordinate else { return }
        LocationModel.getAddressFromLatLon(pdblLatitude: locValue.latitude, withLongitude: locValue.longitude) { addressDataModel in
            self.addressDataModel = addressDataModel
            self.locationModelProtocol?.onLocationAddressReady(addressDataModel: addressDataModel)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}
