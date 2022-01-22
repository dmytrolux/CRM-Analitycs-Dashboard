//
//  ThirdViewController.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 08.01.2022.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var backTotalUserL: KernLabel!
    @IBOutlet weak var deteilTotalUserV: StatisticDetailView!
    @IBOutlet weak var chartUserLabel: KernLabel!
    @IBOutlet weak var rangeYearForCollection: KernButton!
    @IBOutlet weak var typeChartButton: KernButton!
    @IBOutlet weak var collDetailV: UICollectionView!
    
    //MARK: - Colects Set
    let CollDetailID = "CollDetailTVC"
    var data: UsersStatistic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let data = data else { return }
        deteilTotalUserV.setupView(data: data)
    }
    
    @IBAction func pressedBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func pressedTypeChart(_ sender: UIButton) {
    }
    
   
}


//MARK: - Extensions for Collections


        
