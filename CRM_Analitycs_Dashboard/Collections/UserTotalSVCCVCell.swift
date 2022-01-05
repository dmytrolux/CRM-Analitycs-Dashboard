//
//  UserTotalSVC-CVCell.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 05.01.2022.
//

import UIKit

class UserTotalSVCCVCell: UICollectionViewCell {
    @IBOutlet weak var backView: UIView!{
        didSet{
            backView.layer.cornerRadius = 7
            backView.layer.masksToBounds = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
