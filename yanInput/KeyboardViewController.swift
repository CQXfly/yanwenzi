//
//  KeyboardViewController.swift
//  yanInput
//
//  Created by 崇庆旭 on 2017/5/9.
//  Copyright © 2017年 崇庆旭. All rights reserved.
//

import UIKit
import YANKit
//import Alamofire

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    dynamic func fuck (){
        let context = NSExtensionContext()
        context.open(URL(string: "ywz://")! as URL, completionHandler: nil)
        var responder = self as UIResponder?
        while (responder != nil) {
            if responder?.responds(to: Selector("openURL:")) == true {
                responder?.perform(Selector("openURL:"), with: URL(string: "ywz://")!)
            }
            responder = responder!.next
        }
        
//        self.open(url: URL(string: "ywz://")!)
//        w.loadRequest(URLRequest(url: URL(string: "ywz://")!))
     
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取最新数据
//        getYanwenzi()
        
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 48))
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(fuck), for: .allEvents)
        view.addSubview(btn)
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
//MARK:
    /// get yanwenzi ```data```
//    func getYanwenzi(){
//        YanNetKit.get("", withParams: <#T##Dictionary<String, Any>#>, withCompeletionHandle: <#T##YanNetKit.CompeletionHandle##YanNetKit.CompeletionHandle##(Result<Any>, Array<Any>) -> ()#>)
//    }
//    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

}


extension UIResponder {
//    func open(urll:String)->() {
//        
//        var responder = self
//        while responder != nil {
//            if responder.responds(to: #selector(open(urll:))) {
//                responder.perform(#selector(open(url:)), with: URL(string: urll), afterDelay: 0)
//                return;
//            }
//            responder = responder.next!
//        }
//        
//        
//    }
}
