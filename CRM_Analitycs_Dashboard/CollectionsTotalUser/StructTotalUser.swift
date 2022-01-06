//
//  StructTotalUser.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 06.01.2022.
//

import Foundation
import UIKit

struct TotalUserStruct {
    var targetInt: Int
    var lessInt: Int
   //var totalUser = targetUserInt - lessUserInt
    
}


class TotalUserClass {
    var totalUserArray = [TotalUserStruct]()
    
    init(){
        setupTotalUsers()
    }
    
    func setupTotalUsers () {
        let p1 = TotalUserStruct(targetInt: 2000, lessInt: 1000)
        let p2 = TotalUserStruct(targetInt: 3200, lessInt: 1430)
        let p3 = TotalUserStruct(targetInt: 4500, lessInt: 1850)
        self.totalUserArray = [p1, p2, p3]
        
    }
}
