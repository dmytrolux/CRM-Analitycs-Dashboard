//
//  SecondViewController.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 05.01.2022.
//

import UIKit

 class SecondViewController: UIViewController {
    
//MARK: - IBOutlet
    @IBOutlet weak var dashboardL: UILabel!{
        didSet{
            dashboardL.attributedText =  NSMutableAttributedString(string: "Dashboard", attributes: [NSAttributedString.Key.kern: 2])
        }
    }
    @IBOutlet weak var dailyL: UILabel!{
        didSet{
            dailyL.attributedText =  NSMutableAttributedString(string: "Daily Sales Results", attributes: [NSAttributedString.Key.kern: 1])
        }
    }
    @IBOutlet weak var totalUserCV: UICollectionView!
    
    //MARK: - Add
    
    var collectTUser : TotalUserColl = TotalUserColl()
    
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        self.totalUserCV.register(UINib(nibName: "UserTotalSVCCVCell", bundle: nil), forCellWithReuseIdentifier: "UserTotalSVCCVCell")
        self.totalUserCV.dataSource = self
        self.totalUserCV.delegate = self
        
        
    }
    

  

}

//MARK: - Extensions
extension SecondViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectTUser.collectionTU.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = totalUserCV.dequeueReusableCell(withReuseIdentifier: "UserTotalSVCCVCell", for: indexPath) as! UserTotalSVCCVCell
        return cell
    }
    
    
}
