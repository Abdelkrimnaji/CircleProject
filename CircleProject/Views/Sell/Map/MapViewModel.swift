//
//  MapViewModel.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 13/02/2021.
//

import SwiftUI
import MapKit
import CoreLocation

class MapViewModel: NSObject,ObservableObject,CLLocationManagerDelegate{
    @Published var mapView = MKMapView()
    @Published var region : MKCoordinateRegion!
    @Published var permissionDenied = false
    @Published var mapType : MKMapType = .standard
    @Published var searchTxt = ""
    @Published var places : [Place] = []
    @Published var userLocation = ""
    @Published var cityName = ""
    
    func focusLocation(){
        guard let _ = region else{return}
        mapView.setRegion(region, animated: true)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }
    
    func searchQuery(){
        places.removeAll()
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchTxt
        request.resultTypes = .address
        
        MKLocalSearch(request: request).start { (response, _) in
            guard let result = response else{return}
            
            self.places = result.mapItems.compactMap({ (item) -> Place? in
                return Place(placemark: item.placemark)
            })
        }
    }
    
    func selectPlace(place: Place){
        searchTxt = ""
        
        guard let coordinate = place.placemark.location?.coordinate else{return}
        
        let pointAnnotation = MKPointAnnotation()
        pointAnnotation.coordinate = coordinate
        pointAnnotation.title = place.placemark.name ?? "No Name"
        dump(place.placemark)
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotation(pointAnnotation)
        
        let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .denied:
            permissionDenied.toggle()
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse:
            manager.requestLocation()
        default:
            ()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func getCity(from location: CLLocation, completion: @escaping (_ city: String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            completion(placemarks?.first?.locality,error)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else{return}
        
        self.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        
        let pointAnnotation = MKPointAnnotation()
        pointAnnotation.coordinate = location.coordinate
        getCity(from: location) { city, error in
                guard let city = city, error == nil else { return }
                self.userLocation = city
                pointAnnotation.title = city
                self.cityName = city
            }
//        mapView.removeAnnotations(mapView.annotations)
//        mapView.addAnnotation(pointAnnotation)
        self.mapView.setRegion(self.region, animated: true)
        self.mapView.setVisibleMapRect(self.mapView.visibleMapRect, animated: true)
    }
}
