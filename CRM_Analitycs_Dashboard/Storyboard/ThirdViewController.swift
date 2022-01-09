//
//  ThirdViewController.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 08.01.2022.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var backTotalUserL: UILabel!{
        didSet{
            backTotalUserL.attributedText =  NSMutableAttributedString(string: "Total User", attributes: [NSAttributedString.Key.kern: 2])
        }
    }
    //add outlet view with xib
    @IBOutlet weak var deteilTotalUserV: UIView!{
        didSet{
            deteilTotalUserV.layer.cornerRadius = 12
            deteilTotalUserV.clipsToBounds = true
            
        }
    }
    
    
    
    @IBOutlet weak var collDetailV: UICollectionView!
    
    
    
    var testInt = ""
    
    //MARK: - Colects Set
    let CollDetailID = "CollDetailTVC"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
         print(testInt)
       
        
        
        
            /*
        // Register cell of first collection
        self.collDetailV.register(UINib(nibName: CollDetailID, bundle: nil), forCellWithReuseIdentifier: CollDetailID)
        self.collDetailV.dataSource = self
        self.collDetailV.delegate = self
        */
    }
    

    

}

/*
//MARK: - Extensions for Collections
 //Вертикальна колекція
extension ThirdViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            return collectTUser.totalUserArray.count
        }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = totalUserCV.dequeueReusableCell(withReuseIdentifier: totUsSecContID, for: indexPath) as! UserTotalSVCCVCell
            let userData = collectTUser.totalUserArray[indexPath.item]
            cell.setupCell(totalUser: userData)
            return cell
    }
}
*/

        
