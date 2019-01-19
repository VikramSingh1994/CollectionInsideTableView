////
////  APIManager.swift
////  AlamoFire_WebService
////
////  Created by Vikram Singh on 20/01/19.
////  Copyright © 2016 admin. All rights reserved.
////
//
//import UIKit
////import SVProgressHUD
//import Alamofire
//// pod 'Alamofire', '~> 4.5'
//
//class APIManager: NSObject {
//
//    class func callAPI(postData: Any,url:String,methodType: String,  OnResultBlock: @escaping (_ responseData: Any,_ status:String) -> Void) {
//        if !reachability.isReachable {
//            self.iToastMessage(msg: "No Internet Connection, try later!")
//        } else {
//            let url = URL(string: url)
//            let postData1 = try! JSONSerialization.data(withJSONObject: postData,options: [])
//            var request = URLRequest(url: url!)
//            request.httpMethod = methodType
//            request.httpBody = postData1
//            request.allHTTPHeaderFields = ["Content-Type" : "application/json"]
//
//
//            Alamofire.request(request)
//                .responseJSON { response in
//
//                    switch(response.result) {
//                    case .success(_):
//                        if let data = response.result.value {
//                            OnResultBlock((data) ,"true")
//                        }
//                        break
//
//                    case .failure(_):
//                        if let data = response.data,
//                            let responseString = String(data: data, encoding: .utf8) {
//                            print(responseString)
//                        }
//                        print(response.result.error!)
//                        let dic = NSMutableDictionary.init()
//                        dic .setValue("Connection Time Out ", forKey: "Message")
//                        OnResultBlock(dic,"false")
//
//                        break
//                    }
//            }
//        }
//    }
//
//
//    //MARK:
//    //MARK: API Without Secureity Parameter
//    class func callAPIBYGET(url:String,OnResultBlock: @escaping (_ dict: NSDictionary,_ status:String) -> Void) {
//
//        if !reachability.isReachable {
//            self.iToastMessage(msg: "No Internet Connection, try later!")
//        } else  {
//            request(url, method: .get, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
//                print("------\(String(describing: response.response?.statusCode))-----")
//                if  response.response?.statusCode == nil {
//                    return;
//                }
//
//                if (response.response?.statusCode)! != 200{//No recordFound
//
//                    if let data = response.result.value {
//                        let dictdata = NSMutableDictionary()
//                        let dataQ = data as! NSDictionary
//                        if dataQ.value(forKey: "Message") != nil {
//                            dictdata.setValue(data, forKey: "data")
//                            OnResultBlock((dictdata) ,"false")
//                            self.iToastMessage(msg: (data as! NSDictionary).value(forKey: "Message") as! String)
//                            return;
//                        }
//                    }
//
//                    let data = [  "Message":ERROR_NO_RECORD] as NSDictionary;
//                    let dictdata = NSMutableDictionary()
//                    dictdata.setValue(data, forKey: "data")
//                    OnResultBlock((dictdata) ,"false")
//                    self.iToastMessage(msg: ERROR_NO_RECORD)
//                    return;
//                }
//
//                
//                switch(response.result) {
//
//                case .success(_):
//                    if let data = response.result.value {
//
//
//
//
//                        let dictdata = NSMutableDictionary()
//                        dictdata.setValue(data, forKey: "data")
//                        OnResultBlock((dictdata) ,"true")
//                    }
//                    break
//
//                case .failure(_):
//                    if response.response?.statusCode == 200 {
//                        let dic = NSMutableDictionary.init()
//                        dic .setValue("Successfully update", forKey: "Message")
//                        OnResultBlock(dic,"false")
//
//                    }else{
//
//                        print(response.result.error!)
//                        let dic = NSMutableDictionary.init()
//                        dic .setValue("Connection Time Out ", forKey: "Message")
//                        OnResultBlock(dic,"false")
//                    }
//
//                    break
//                }
//            }
//        }
//    }
//
//    class func callAPIBYPOST(parameter:[String: Any],url:String,  OnResultBlock: @escaping (_ dict: NSDictionary,_ status:String) -> Void) {
//
//
//
//
//
//        if !reachability.isReachable {
//            self.iToastMessage(msg: "No Internet Connection, try later!")
//
//        } else {
//            print(parameter)
//            request(url, method: .post, parameters: parameter, encoding: URLEncoding.default).validate(contentType: ["application/json","text/html"]).responseJSON { (response) in
//
//
//                if response.response?.statusCode == nil {
//                    let data = [  "Message":ERROR_NO_RECORD] as NSDictionary;
//                    let dictdata = NSMutableDictionary()
//                    dictdata.setValue(data, forKey: "data")
//                    OnResultBlock((dictdata) ,"false")
//                    self.iToastMessage(msg: ERROR_NO_RECORD)
//                    return;
//                }
//
//                if (response.response?.statusCode)! != 200 {//No recordFound
//
//                    if let data = response.result.value {
//                        let dictdata = NSMutableDictionary()
//                        let dataQ = data as! NSDictionary
//                        if dataQ.value(forKey: "Message") != nil {
//                            dictdata.setValue(data, forKey: "data")
//                            OnResultBlock((dictdata) ,"false")
//                            // self.iToastMessage(msg: (data as! NSDictionary).value(forKey: "Message") as! String)
//                            return;
//                        }
//                    }
//
//                    let data = [  "Message":ERROR_NO_RECORD] as NSDictionary;
//                    let dictdata = NSMutableDictionary()
//                    dictdata.setValue(data, forKey: "data")
//                    OnResultBlock((dictdata) ,"false")
//                    self.iToastMessage(msg: ERROR_NO_RECORD)
//                    return;
//                }
//
//                switch(response.result) {
//
//                case .success(_):
//                    if let data = response.result.value {
//                        let dictdata = NSMutableDictionary()
//                        dictdata.setValue(data, forKey: "data")
//                        OnResultBlock((dictdata) ,"true")
//                    }
//
//                    break
//
//                case .failure(_):
//                    if response.response?.statusCode == 200 {
//                        let dic = NSMutableDictionary.init()
//                        dic .setValue("Successfully update", forKey: "Message")
//                        OnResultBlock(dic,"true")
//
//                    }else{
//
//                        print(response.result.error!)
//                        let dic = NSMutableDictionary.init()
//                        dic .setValue("Connection Time Out ", forKey: "Message")
//                        OnResultBlock(dic,"false")
//                    }
//                    break
//                }
//            }
//        }
//    }
//
//    class func callAPIBYPUT(parameter:[String: Any],url:String,OnResultBlock: @escaping (_ dict: NSDictionary,_ status:String) -> Void) {
//        if !reachability.isReachable {
//            self.iToastMessage(msg: "No Internet Connection, try later!")
//        } else {
//            print(parameter)
//            // request(url, method: .put, parameters: parameter, encoding: URLEncoding.default).validate(contentType: ["application/json","text/html"]).responseJSON { (response) in
//
//            request(url, method: .put, parameters:parameter, encoding: JSONEncoding.default, headers: nil).responseString  { (response:DataResponse<String>) in
//
//                if (response.response?.statusCode)! != 200{//No recordFound
//                    //print(response.result.value)
//
//                    if response.result.value != nil {
//                        let jsonString: String = response.result.value!
//                        let data = jsonString.data(using: .utf8)!
//                        let jsonData: NSDictionary = try! JSONSerialization.jsonObject(with: data) as! NSDictionary
//                        print(jsonData)
//
//                        let dictdata = NSMutableDictionary()
//                        if jsonData.value(forKey: "Message") != nil {
//                            dictdata.setValue(data, forKey: "data")
//                            OnResultBlock((dictdata) ,"false")
//                            self.iToastMessage(msg:jsonData.value(forKey: "Message") as! String)
//                            return;
//                        }
//                    }
//
//                    let data = [  "Message":ERROR_NO_RECORD] as NSDictionary;
//                    let dictdata = NSMutableDictionary()
//                    dictdata.setValue(data, forKey: "data")
//                    OnResultBlock((dictdata) ,"false")
//                    self.iToastMessage(msg: ERROR_NO_RECORD)
//                    return;
//                }
//
//                switch(response.result) {
//
//                case .success(_):
//                    if let data = response.result.value {
//                        let dictdata = NSMutableDictionary()
//                        dictdata.setValue(data, forKey: "data")
//                        OnResultBlock((dictdata) ,"true")
//                    }
//
//                    break
//
//                case .failure(_):
//
//                    if response.response?.statusCode == 200 {
//                        let dic = NSMutableDictionary.init()
//                        dic .setValue("Successfully update", forKey: "Message")
//                        OnResultBlock(dic,"true")
//
//                    }else{
//
//                        print(response.result.error!)
//                        let dic = NSMutableDictionary.init()
//                        dic .setValue("Connection Time Out ", forKey: "Message")
//                        OnResultBlock(dic,"false")
//                    }
//                    break
//                }
//            }
//        }
//    }
//
//    class func callAPIBYDELETE(parameter:[String: Any],url:String,OnResultBlock: @escaping (_ dict: NSDictionary,_ status:String) -> Void) {
//
//        if !reachability.isReachable {
//            self.iToastMessage(msg: "No Internet Connection, try later!")
//        } else {
//            print(parameter)
//
//            request(url, method: .delete, parameters: parameter, encoding: URLEncoding.default).validate(contentType: ["application/json","text/html"]).responseJSON { (response) in
//                print(response.response?.statusCode)
//                if (response.response?.statusCode)! != 200{//No recordFound
//
//                    if let data = response.result.value {
//                        let dictdata = NSMutableDictionary()
//                        let dataQ = data as! NSDictionary
//                        if dataQ.value(forKey: "Message") != nil {
//                            dictdata.setValue(data, forKey: "data")
//                            OnResultBlock((dictdata) ,"false")
//                            self.iToastMessage(msg: (data as! NSDictionary).value(forKey: "Message") as! String)
//                            return;
//                        }
//                    }
//
//
//
//                    let data = [  "Message":ERROR_NO_RECORD] as NSDictionary;
//                    let dictdata = NSMutableDictionary()
//                    dictdata.setValue(data, forKey: "data")
//                    OnResultBlock((dictdata) ,"false")
//                    self.iToastMessage(msg: ERROR_NO_RECORD)
//                    return;
//                }
//
//                switch(response.result) {
//
//                case .success(_):
//                    if let data = response.result.value {
//                        let dictdata = NSMutableDictionary()
//                        dictdata.setValue(data, forKey: "data")
//                        OnResultBlock((dictdata) ,"true")
//                    }
//
//                    break
//
//                case .failure(_):
//
//                    if response.response?.statusCode == 200 {
//                        let dic = NSMutableDictionary.init()
//                        dic .setValue("Successfully update", forKey: "Message")
//                        OnResultBlock(dic,"true")
//
//                    }else{
//
//                        print(response.result.error!)
//                        let dic = NSMutableDictionary.init()
//                        dic .setValue("Connection Time Out ", forKey: "Message")
//                        OnResultBlock(dic,"false")
//                    }
//                    break
//                }
//            }
//        }
//    }
//    class  func callAPIWithImage(parameter:NSDictionary,url:String,image:UIImage,imageKeyName:String,OnResultBlock: @escaping (_ dict: NSDictionary,_ status:String) -> Void){
//
//        print("parameter:-\(parameter),url:-\(url),imageKeyName:-\(imageKeyName)")
//
//        if !reachability.isReachable {
//            let dic = NSMutableDictionary.init()
//            dic.setValue("No Internet Connection, try later!", forKey: "Message")
//            dic.setValue("false", forKey: "status")
//            OnResultBlock(dic,"failure")
//
//        } else {
//
//
//            upload(multipartFormData: { (multiPartFormData:MultipartFormData) in
//
//                if  let imageData = UIImageJPEGRepresentation(image, 0.5) {
//                    let fileName = String(format: "%f.jpg", NSDate.init().timeIntervalSince1970)
//                    multiPartFormData.append(imageData, withName: imageKeyName, fileName:fileName , mimeType: "image/jpeg")
//                }
//
//                for (key, value) in parameter {
//
//                    print("---key: \(key)---","----value: \(value)")
//
//                    multiPartFormData.append((value as! String).data(using: String.Encoding.utf8)!, withName: key as! String)
//                }
//
//            }, to: url, method: .post) { (encodingResult:SessionManager.MultipartFormDataEncodingResult) in
//
//                switch (encodingResult){
//
//                case .success(request: let upload, streamingFromDisk: _, streamFileURL: _):
//
//                    ///--------JSON----------
//                    upload.responseJSON { response in
//                        print(response.response?.statusCode) // URL response
//                        // print(response.result.value!)   // result of response serialization
//
//                        if let JSON = response.result.value {
//                            OnResultBlock(JSON as! NSDictionary,"true")
//                        }
//                    }
//
//                case .failure(let encodingError):
//                    print(encodingError)
//                    let dic = NSMutableDictionary.init()
//                    dic.setValue("Connection Time Out ", forKey: "Message")
//                    OnResultBlock(dic,"false")
//                }
//            }
//        }
//    }
//
//    class func iToastMessage(msg: String) {
//        let viewController =  (UIApplication.shared.keyWindow?.rootViewController)! as UIViewController
//        viewController.view.makeToast(message:  msg, duration: TimeInterval(2.0), position: .bottom, backgroundColor: UIColor.getCustomBlueColor(), messageColor: .white)
//    }
//
//
//    //MARK:
//    //MARK: Get Device ID
//    class func get_DeviceID() -> String {
//        let device = UIDevice.current
//        let str_deviceID = device.identifierForVendor?.uuidString
//        return str_deviceID!
//    }
//
//    //MARK:
//    //MARK: Get Device Type
//    class func get_DeviceType() -> String {
//        let deviceType = "ios"
//        return deviceType
//    }
//
//}
