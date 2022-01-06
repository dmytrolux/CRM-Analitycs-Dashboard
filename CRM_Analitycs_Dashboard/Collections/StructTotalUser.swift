//
//  StructTotalUser.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 06.01.2022.
//

import Foundation
import UIKit

struct TotalUser {
    var targetUserInt: Int
    var lessUserInt: Int
   //var totalUser = targetUserInt - lessUserInt
    
}


class TotalUserColl {
    var collectionTU = [TotalUser]()
    
    init(){
        setupTotalUser()
    }
    
    func setupTotalUser () {
        let p1 = TotalUser(targetUserInt: 2000, lessUserInt: 1000)
        let p2 = TotalUser(targetUserInt: 3200, lessUserInt: 1430)
        let p3 = TotalUser(targetUserInt: 4500, lessUserInt: 1850)
        self.collectionTU = [p1, p2, p3]
        
    }
}
