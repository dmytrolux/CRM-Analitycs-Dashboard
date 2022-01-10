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
    @IBOutlet weak var deteilTotalUserV: StatisticDetailView!{
        didSet{
            deteilTotalUserV.layer.cornerRadius = 12
            deteilTotalUserV.clipsToBounds = true
        }
    }
    @IBOutlet weak var collDetailV: UICollectionView!
    
    //MARK: - Colects Set
    let CollDetailID = "CollDetailTVC"
    var data: UsersStatistic?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let data = data else { return }
        deteilTotalUserV.setupView(data: data)
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

        
