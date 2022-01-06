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
     @IBOutlet weak var yearCV: UICollectionView!
     
    
    //MARK: - Add
    
    var collectTUser : TotalUserClass = TotalUserClass()
     var collectYUser : VertDiagClass = VertDiagClass()
    
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        self.totalUserCV.register(UINib(nibName: "UserTotalSVCCVCell", bundle: nil), forCellWithReuseIdentifier: "UserTotalSVCCVCell")
        self.totalUserCV.dataSource = self
        self.totalUserCV.delegate = self
        
        
        self.yearCV.register(UINib(nibName: "VertDiagrameCell", bundle: nil), forCellWithReuseIdentifier: "VertDiagrameCell")
        self.yearCV.dataSource = self
        self.yearCV.delegate = self
        
    }
    

  

}

//MARK: - Extensions
extension SecondViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == totalUserCV{
            return collectTUser.totalUserArray.count
        }
        else {
            return collectYUser.yearUserArray.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == totalUserCV{
        
        
        
        
        
        
        let cell = totalUserCV.dequeueReusableCell(withReuseIdentifier: "UserTotalSVCCVCell", for: indexPath) as! UserTotalSVCCVCell
        
        let userData = collectTUser.totalUserArray[indexPath.item]
        
        cell.setupCell(totalUser: userData)
        
        return cell
        }
        else {
            let cell = yearCV.dequeueReusableCell(withReuseIdentifier: "VertDiagrameCell", for: indexPath) as! VertDiagrameCell
            
            let userData = collectYUser.yearUserArray[indexPath.item]
            
            cell.setupCell(userOfYear: userData)
            
            return cell
        }
        
        
        
        
       
    }
    
    
}
