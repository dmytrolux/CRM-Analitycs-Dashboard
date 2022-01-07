//
//  StructVertDiagrama.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 06.01.2022.
//

import Foundation
import UIKit

struct VertDiagStruct {
    var year: Int
    var targetInt: Int
    var lessInt: Int
   
}


class VertDiagClass {
    var yearUserArray = [VertDiagStruct]()
    
    init(){
        setupYearUsersArray()
    }
    
    func setupYearUsersArray () {
        let o1 = VertDiagStruct(year: 2003, targetInt: 3000, lessInt: 1000)
        let o2 = VertDiagStruct(year: 2004, targetInt: 2000, lessInt: 1430)
        let o3 = VertDiagStruct(year: 2005, targetInt: 4500, lessInt: 3000)
        let o4 = VertDiagStruct(year: 2006, targetInt: 5000, lessInt: 1000)
        let o5 = VertDiagStruct(year: 2007, targetInt: 2000, lessInt: 1430)
        let o6 = VertDiagStruct(year: 2008, targetInt: 3600, lessInt: 1850)
        let o7 = VertDiagStruct(year: 2009, targetInt: 2000, lessInt: 1000)
        let p1 = VertDiagStruct(year: 2010, targetInt: 2000, lessInt: 1000)
        let p2 = VertDiagStruct(year: 2011, targetInt: 3200, lessInt: 1430)
        let p3 = VertDiagStruct(year: 2012, targetInt: 4500, lessInt: 3000)
        let p4 = VertDiagStruct(year: 2013, targetInt: 2000, lessInt: 1000)
        let p5 = VertDiagStruct(year: 2014, targetInt: 3200, lessInt: 1430)
        let p6 = VertDiagStruct(year: 2015, targetInt: 4500, lessInt: 1850)
        let p7 = VertDiagStruct(year: 2016, targetInt: 2000, lessInt: 1000)
        let p8 = VertDiagStruct(year: 2017, targetInt: 3200, lessInt: 800)
        let p9 = VertDiagStruct(year: 2018, targetInt: 4500, lessInt: 1850)
        let p10 = VertDiagStruct(year: 2019, targetInt: 5400, lessInt: 1850)
        let p11 = VertDiagStruct(year: 2020, targetInt: 4500, lessInt: 1850)
        let p12 = VertDiagStruct(year: 2021, targetInt: 2200, lessInt: 1850)
        self.yearUserArray = [o1, o2, o3, o4, o5, o6, o7, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12]
        
    }
}
