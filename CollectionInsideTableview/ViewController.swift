//
//  ViewController.swift
//  CollectionInsideTableview
//
//  Created by Vikram Singh on 20/01/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class CatCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
}

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var constantCatCollectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    var currentIndex = 0
    let ary  = ["Test model 1","Test model 2","Test model 3","Test model 4","Test model 5","Test model 6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    private func viewHightShow(status:Int) {
        UIView.animate(withDuration: 0.2,
                       delay: 0.01,
                       options: UIViewAnimationOptions.transitionCurlDown,
                       animations: { () -> Void in
                        if status == 1 {//}|| self.currentIndex == 0{
                            self.constantCatCollectionViewHeight.constant = 100
                        }else{
                            self.constantCatCollectionViewHeight.constant = 0
                        }
                        self.view.layoutIfNeeded()
        }, completion: { (finished) -> Void in
            // ....
        })
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var tablCellOne : HomeTableViewCellOne?
        var tablCellTwo : HomeTableViewCellTwo?
        //  if indexPath.row % 2 == 0{
        
        if indexPath.row == 0{
            tablCellOne = (self.tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCellOne") as? HomeTableViewCellOne)
            let img =  UIImage.init(named: "home1")
            let imageView1 = img?.resize(toTargetSize:CGSize(width: 374, height: 249.67))
            tablCellOne?.imgView.image = imageView1
            tablCellOne?.lblTitle.text =  ""
            tablCellOne?.lblDes.text =  ""
            return tablCellOne!
        }else if indexPath.row == 1{
            tablCellTwo = (self.tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCellTwo") as? HomeTableViewCellTwo)
            return tablCellTwo!
        }else if indexPath.row == 2{
            tablCellOne = (self.tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCellOne") as? HomeTableViewCellOne)
            let img =  UIImage.init(named: "exercise1")
            let imageView1 = img?.resize(toTargetSize:CGSize(width: 374, height: 249.67))
            tablCellOne?.imgView.image = imageView1
            tablCellOne?.lblTitle.text =  "Exercise"
            tablCellOne?.lblDes.text =  ""
            return tablCellOne!
        }else if indexPath.row == 3 {
            tablCellTwo = (self.tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCellTwo") as? HomeTableViewCellTwo)
            return tablCellTwo!
        }else {
            tablCellOne = (self.tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCellOne") as? HomeTableViewCellOne)
            let img =  UIImage.init(named: "yoga2")
            let imageView1 = img?.resize(toTargetSize:CGSize(width: 374, height: 249.67))
            tablCellOne?.imgView.image = imageView1
            tablCellOne?.lblTitle.text =  "yoga"
            tablCellOne?.lblDes.text =  ""
            return tablCellOne!
        }
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if  indexPath.row > 2{
            currentIndex = 0
        }else{
            currentIndex = 1
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    
//MARK:- Call Webservices-
    
    
//    func wsGetList() {
//        var parameter: [String: Any] =  ["PageNo":1,
//                                         "Latitude": "latt",
//                                         "Longitude": "long"
//        ]
//        print("request params: \(parameter)")
//        APIManager.callAPIBYPOST(parameter: parameter, url: "API_GetProduct") { (response, status) in
//            print("------\(response)------")
//            let dictResponse = response["data"] as? NSDictionary
//            if dictResponse != nil{
//                if status == "true" {
//                    if dictResponse != nil{
//                        if  dictResponse!["ResponseCode"] as! NSNumber == 200 {//Success
//                            // UserDefaults_SaveData(dictData: dictData!["SessionKey"]!, keyName:SESSION_KEY )
//                            // self.gotoOnLoginScreen()
//                            let dictData = dictResponse!["Data"] as? NSDictionary
//                            
//                            if dictData != nil{
//                                print(dictData!)
//                                self.arrResponse = dictData?.value(forKey: "Records") as! NSArray
//                                let getFilterKey0 = NSPredicate(format: "ListingType == %@","Urgent")
//                                let ary = (self.arrResponse).filtered(using: getFilterKey0) as NSArray
//                                reloadData()
//
//                            }
//                        }
//                }}
//            else{
//                //Failer
//                self.view.makeToast(message:  response["Message"] as! String, duration: TimeInterval(3.0), position: .bottom, backgroundColor: UIColor.getCustomBlueColor(), messageColor: .white)
//                
//            }
//        }
//    }
//  }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ary.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell : CatCollectionViewCell
        cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "CatCollectionViewCell", for: indexPath) as? CatCollectionViewCell)!
        
        //cell.imgView.image = UIImage.init(named: ary[indexPath.row])
        cell.lblTitle.text = ary[indexPath.row]
        
        //        let obj = self.symptomsDataAry[collectionView.tag].symptoms[indexPath.row]
        //        cell.lblTitle.text = obj.smTitle
        //        cell.lblTitle.backgroundColor = .white
        //        cell.lblTitle.textColor = Utility.colorFromHex(hex:self.symptomsDataAry[collectionView.tag].smcColor.color0)
        //        let img = UIImageView()
        //        if obj.isSave == "0"{
        //            img.imageFromURL(urlString: obj.smImage)
        //        }else{
        //            img.imageFromURL(urlString: obj.smImageSel)
        //        }
        //        cell.imgView.image = img.image?.resize(toTargetSize:CGSize(width: 70, height: 70))
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//    self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension ViewController: DelegateDidSelectFromCell {
    //------Approval------------------
    func collectionView1(btnTag : Int,index : IndexPath)
    {
        print(index.row)
    }
}
