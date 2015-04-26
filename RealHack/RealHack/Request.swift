//
//  Request.swift
//  RealHack
//
//  Created by Asif Junaid on 4/26/15.
//
//

import Foundation
class Request : NSObject
{
    
    
   class func getPostParams() -> String
    {
 
        return ""
    }
    
class func fetchPostUrl(url:NSURL, params:[String:AnyObject]?, onSuccess:((data: AnyObject) -> Void)?, onFail:((message:String) -> Void)?){
    
    let request = NSMutableURLRequest(URL: url)
    request.HTTPMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    if(params != nil){
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params!, options: NSJSONWritingOptions.PrettyPrinted, error: nil)
    }
    
    let queue = NSOperationQueue()
    
    NSURLConnection.sendAsynchronousRequest(request, queue: queue) { (response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in
        if error == nil{
            var err:NSError?
            if data != nil{
                if var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as? NSDictionary {
                    onSuccess!(data: jsonResult)
                }
                else
                {
                    onFail!(message: "error on parsing")
                }
            }
            else
            {
                onFail!(message: "No data received")
            }
        }
        else{
            onFail!(message:error.description)
        }
    }
}
   
//
//    APIClient.sharedInstance.fetchPostUrlWithCookieHandling(signUpUrl,headers: headers, params: params, onSuccess: {(data, res) -> Void in
//    
//    if let cookieValues: String? = res.allHeaderFields ["Set-Cookie"] as! String? {
//    println("Sign Up cookie Values \(cookieValues!)")
//    self.cookieHandler.storeCookies(cookieValues!)
//    }
//    NSUserDefaults.standardUserDefaults().setBool(true, forKey: "loggedIn")
//    NSUserDefaults.standardUserDefaults().setBool(false, forKey: "firstTimeUser")
//    callback (true, errorMessage)
//    
//    }, onFail:{ (message) -> Void in
//    errorMessage = "" + message
//    callback(false,errorMessage)
//    })
}
