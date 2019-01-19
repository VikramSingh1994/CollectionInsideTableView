//
//  HomeTableViewCell.swift
//  Fern28
//
//  Created by Vikram Singh on 15/01/19.
//  Copyright © 2019 Vikram Singh. All rights reserved.
//

import UIKit

protocol  DelegateDidSelectFromCell {
    func collectionView1(btnTag : Int,index: IndexPath)
}

class HomeTableViewCellOne: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDes: UILabel!
    //var delegateIndex : DelegateDidSelectFromCell? = nil
}


class HomeTableViewCellTwoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDes: UILabel!
    //var delegateIndex : DelegateDidSelectFromCell? = nil
}

class HomeTableViewCellTwo: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    var delegateIndex : DelegateDidSelectFromCell? = nil
    let ary = ["food1","food2","food3","food4","food5"]
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     }

}
extension HomeTableViewCellTwo : UICollectionViewDataSource,UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return ary.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell : HomeTableViewCellTwoCollectionViewCell
        cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "HomeTableViewCellTwoCollectionViewCell", for: indexPath) as? HomeTableViewCellTwoCollectionViewCell)!
        let img =  UIImage.init(named: ary[indexPath.row])
        let imageView1 = img?.resize(toTargetSize:CGSize(width: 254, height: 242))
        cell.imgView.image = imageView1
        cell.lblTitle.text =  ""
        cell.lblDes.text =  ""
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.delegateIndex?.collectionView1(btnTag : indexPath.row,index: indexPath)
    }
    
}
