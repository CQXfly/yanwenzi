//
//  ViewController.swift
//  yanwenzi
//
//  Created by 崇庆旭 on 2017/5/8.
//  Copyright © 2017年 崇庆旭. All rights reserved.
//

import UIKit
import YANKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        getdataFromServer()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController {
    
    /**
     get data form server for all yanwenzi
     - sda:sada
     - sda:sdasfada
     
     - Parameter str:sdadad
     
     */
    func getdataFromServer() {
        YanNetKit.get(YanUrl.keyboardGetYanData, withParams: ["sds":""]) { (T,data) in
            if(T.isSuccess){
                print(data)
                
                let defaults = UserDefaults(suiteName: YanUrl.main_app_groups)
                defaults?.set(data, forKey: YanUrl.yanwenziDataSource)
            }
        }

    }
}

