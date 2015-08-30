//
//  NetworkOperation.swift
//  Stormy
//
//  Created by Kyle Kirkland on 8/30/15.
//  Copyright (c) 2015 Kyle Kirkland. All rights reserved.
//

import Foundation

class NetworkOperation {
    
    lazy var config: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
    lazy var session: NSURLSession = NSURLSession(configuration: self.config)
    let queryUrl: NSURL
    
    typealias JSONDictionaryCompletion = [String: AnyObject]? -> ()
    
    init(url: NSURL) {
        self.queryUrl = url
    }
    
    func downloadJSONFromURL(completion: JSONDictionaryCompletion ) {
        
        let request = NSURLRequest(URL: self.queryUrl)
        let dataTask = session.dataTaskWithRequest(request) {
            (let data, let response, let error) in
            
            if let httpResponse =  response as? NSHTTPURLResponse {
                
                switch httpResponse.statusCode {
                case 200:
                    
                    let jsonDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? [String: AnyObject]
                    completion(jsonDictionary)
                default:
                    println("request not successful, http status code \(httpResponse.statusCode)")
                }
                
            } else {
                
            }
        }
        
        dataTask.resume()
        
    }
}