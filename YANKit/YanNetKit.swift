//
//  YanNetKit.swift
//  yanwenzi
//
//  Created by 崇庆旭 on 2017/5/17.
//  Copyright © 2017年 崇庆旭. All rights reserved.
//

import Foundation
import Alamofire


public struct YanUrl {
    public static let keyboardGetYanData:String = "http://ywzo0.juju.la:2874/yan/get-data"
    
    public static let main_app_groups:String = "group.yanwenzi"
    
    public static let yanwenziDataSource:String = "yanwenziDataSource"
}

public class YanNetKit {
    public typealias CompeletionHandle = (Result<Any>,Array<Any>)->()
    //post 
    public static func get(_ url:String,withParams params: Dictionary<String, Any>,withCompeletionHandle compeletion:@escaping CompeletionHandle) {
        
        
        request(url, method: .get).responseJSON { (data) in
            
            compeletion(data.result,data.result.value as! Array<Any>)
        }
        
    }
    
}


public extension UIViewController {
    
    /// Open url inside app extension
    ///
    /// - Parameter url: url
    func open(url: URL) {
        var responder: UIResponder? = self as UIResponder
        let selector = #selector(openURL(_:))
        while responder != nil {
            if responder! is UIApplication {
                responder!.perform(selector, with: url)
                return
            }
            responder = responder?.next
        }
    }
    
    /// Fake selector to suppress compile error
    ///
    /// - Parameter url: useless
    /// - Returns: useless
    func openURL(_ url: URL) -> Bool {
        return true
    }
}
