//
//  StructVertDiagrama.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 06.01.2022.
//

import Foundation
import UIKit

struct YearlyStatistics {
    var year: Int
    var countTarget: Int
    var countTotal: Int
    var percent: Int {
        Int(100.0 / (Double(countTarget) / Double(countTotal)))
}
    
    static func getDemoArrayYearlyStatistics () -> [YearlyStatistics] {
        let o1 = YearlyStatistics(year: 2003, countTarget: 3000, countTotal: 1000)
        let o2 = YearlyStatistics(year: 2004, countTarget: 2000, countTotal: 1430)
        let o3 = YearlyStatistics(year: 2005, countTarget: 4500, countTotal: 3000)
        let o4 = YearlyStatistics(year: 2006, countTarget: 5000, countTotal: 1000)
        let o5 = YearlyStatistics(year: 2007, countTarget: 2000, countTotal: 1430)
        let o6 = YearlyStatistics(year: 2008, countTarget: 3600, countTotal: 1850)
        let o7 = YearlyStatistics(year: 2009, countTarget: 2000, countTotal: 1000)
        let p1 = YearlyStatistics(year: 2010, countTarget: 2000, countTotal: 1000)
        let p2 = YearlyStatistics(year: 2011, countTarget: 3200, countTotal: 1430)
        let p3 = YearlyStatistics(year: 2012, countTarget: 4500, countTotal: 3000)
        let p4 = YearlyStatistics(year: 2013, countTarget: 2000, countTotal: 1000)
        let p5 = YearlyStatistics(year: 2014, countTarget: 3200, countTotal: 1430)
        let p6 = YearlyStatistics(year: 2015, countTarget: 4500, countTotal: 1850)
        let p7 = YearlyStatistics(year: 2016, countTarget: 2000, countTotal: 1000)
        let p8 = YearlyStatistics(year: 2017, countTarget: 3200, countTotal: 1800)
        let p9 = YearlyStatistics(year: 2018, countTarget: 4500, countTotal: 1850)
        let p10 = YearlyStatistics(year: 2019, countTarget: 5400, countTotal: 1850)
        let p11 = YearlyStatistics(year: 2020, countTarget: 4500, countTotal: 1850)
        let p12 = YearlyStatistics(year: 2021, countTarget: 2200, countTotal: 1850)
        return [o1, o2, o3, o4, o5, o6, o7, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12]
    }
    
}
