//
//  ViewController.swift
//  RealHack
//
//  Created by Asif Junaid on 4/25/15.
//
//

import UIKit
import MapKit
class ViewController: UIViewController ,MKMapViewDelegate{
    var midPoint : CGPoint!
    var midCoordinate :CLLocationCoordinate2D!
    var overlayTopLeftCoordinate :CLLocationCoordinate2D!
    var overlayTopRightCoordinate : CLLocationCoordinate2D!
    var overlayBottomLeftCoordinate : CLLocationCoordinate2D!
    var boundary = [CLLocationCoordinate2D()]
    var overlayBottomRightCoordinate1 :CLLocationCoordinate2D!
    @IBOutlet weak var mapviewoutlet: MKMapView!
    @IBOutlet weak var segmentedOutlet: UISegmentedControl!
    var boundaryStrokeColor : UIColor!
    
    @IBAction func segmentChanged(sender: UISegmentedControl) {
        
        switch(segmentedOutlet.selectedSegmentIndex)
        
        {
        
        case 0 : self.mapviewoutlet.mapType = MKMapType.Standard
        
        case 1 : self.mapviewoutlet.mapType = MKMapType.Hybrid
        
        case 2: self.mapviewoutlet.mapType = MKMapType.Satellite
        
        default : break
        
        }
    
    }
    
    var drawLinesToThesePlaces : [CLLocationCoordinate2D]!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        midCoordinate = CLLocationCoordinate2DMake(12.909234, 77.645382)
        
        overlayTopLeftCoordinate = CLLocationCoordinate2DMake(22.4313 , 77.59890)
        
        overlayTopRightCoordinate = CLLocationCoordinate2DMake(22.4313 , 77.59890)
        
        overlayBottomLeftCoordinate = CLLocationCoordinate2DMake(22.4313 , 77.59890)
        
        boundary.removeAtIndex(0)
        
        overlayBottomRightCoordinate1 = overlayBottomRightCoordinate()
        
        var latDelta  = self.overlayTopLeftCoordinate.latitude - self.overlayBottomRightCoordinate1.latitude
        
        var span = MKCoordinateSpanMake(fabs(0.1), 0.0)
        
        var region = MKCoordinateRegionMake(self.midCoordinate, span)
        
        self.mapviewoutlet.region = region
        
        addBoundaryPoints([(CLLocationCoordinate2DMake(12.936548, 77.807816
            )),(CLLocationCoordinate2DMake(12.913124, 77.812279)),(CLLocationCoordinate2DMake(12.913793, 77.787560)),(CLLocationCoordinate2DMake(12.936882, 77.767304))],strokeColor : UIColor.blackColor())
        
        
        addBoundaryPoints([(CLLocationCoordinate2DMake(
            12.917516, 77.623838)),(CLLocationCoordinate2DMake(12.923707, 77.654136)),(CLLocationCoordinate2DMake(12.899445,77.658514)),(CLLocationCoordinate2DMake(12.905218, 77.634738)),(CLLocationCoordinate2DMake(12.917516, 77.623838))],strokeColor : UIColor.greenColor())
        
        addAnnotation("Raja Ram ",subtitle: "Apartment",location: (CLLocationCoordinate2DMake(
            12.917500, 77.634838
            )))
        addAnnotation("Villa suite ",subtitle: "Apartment",location: (CLLocationCoordinate2DMake(
            12.916500, 77.636838
            )))
        
        addAnnotation("Apartment number 34 ",subtitle: "Apartment",location: (CLLocationCoordinate2DMake(
            12.910500, 77.639838
            )))
        addAnnotation("housing apartment",subtitle: "Apartment",location: (CLLocationCoordinate2DMake(
            12.907500, 77.649838
            )))
        
        var params :[String: AnyObject]? = ["status":"single","sports":[
                "cricket",
                "footbal"
                ],"gender": "0","veg": "0","office": "yashwanthpur","school": "whitefield","prferenceFood": [
                    "north",
                    "biryani"
                ],
                "religion": "athiest",
                "budget": [
                    "19000",
                    "70000"
            ]]
        
            var url1 = NSURL (string: "http://192.168.1.198:5000/user")!
            var headers : [(String, String)] = [("Accept","application/json"), ("Content-Type","application/json")]
        Request.fetchPostUrl(url1, params: [:], onSuccess: { (data) -> Void in
                println("succesfully loaded")
                println(data)
                
            }) { (message) -> Void in
                println(message)
        }
    }

    func addAnnotation(title : String,subtitle : String , location : CLLocationCoordinate2D)
    {
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = title
        annotation.subtitle = subtitle
        self.mapviewoutlet.addAnnotation(annotation)
    }
    func mapView(mapView: MKMapView!, didSelectAnnotationView view: MKAnnotationView!) {
        let signInStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signInVC = signInStoryboard.instantiateViewControllerWithIdentifier("flatDetailView") as! UIViewController
        self.navigationController?.pushViewController(signInVC, animated: true)
    }
//    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
//        let button   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
//        button.frame = CGRectMake(100, 100, 100, 50)
//        button.backgroundColor = UIColor.greenColor()
//        button.setTitle("Test Button", forState: UIControlState.Normal)
//        button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
//        self.view.addSubview(button)
//    }
    
    func addBoundaryPoints(boundaryPoints : [CLLocationCoordinate2D],strokeColor : UIColor)
    {

        boundary.removeAll(keepCapacity: false)
        for index in 0 ..< boundaryPoints.count
        {
            boundary.append(boundaryPoints[index])
        }
        
        boundaryStrokeColor = strokeColor
        
        var polyline = MKPolygon(coordinates: &boundary, count: boundary.count)
        
        self.mapviewoutlet.addOverlay(polyline)
        
    }
    
 
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        if overlay is MKPolygon {
            let polygonView = MKPolygonRenderer(overlay: overlay)
            polygonView.strokeColor = boundaryStrokeColor
            
            return polygonView
        }
        return nil
    }
    
    func overlayBottomRightCoordinate()->CLLocationCoordinate2D
    {
         return CLLocationCoordinate2DMake(self.overlayBottomLeftCoordinate.latitude, self.overlayTopRightCoordinate.longitude)
    }
    
    func overlayBoundingMapRect() -> MKMapRect
    {
        var topLeft : MKMapPoint = MKMapPointForCoordinate(self.overlayTopLeftCoordinate)
        var topRight : MKMapPoint = MKMapPointForCoordinate(self.overlayTopRightCoordinate)
        var bottomLeft : MKMapPoint = MKMapPointForCoordinate(self.overlayBottomLeftCoordinate)
        return MKMapRectMake(topLeft.x, topLeft.y, fabs(topLeft.x - topRight.x), fabs(topLeft.y - bottomLeft.y))
        
    }

}

