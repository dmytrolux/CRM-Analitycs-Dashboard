//
//  File.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 07.01.2022.
//

import Foundation



class DataStructure {
    var month: String?
    var dollars: Int?
    required init?() {}
}


struct MonthlyStatistic {
    
    var monthlyMoneyArray: [Int]
    var monthName: String
    
    static let january: [Int] = [2960,
                          1963,
                          925,
                          428,
                          1523,
                          2368,
                          553,
                          62,
                          1845,
                          1848,
                          675,
                          972,
                          972,
                          436,
                          817,
                          1241,
                          821,
                          615,
                          799,
                          2645,
                          399,
                          894,
                          1695,
                          2482,
                          2270,
                          1155,
                          575,
                          1579,
                          478,
                          885]
    static let february: [Int] = [660,
                           32,
                           1688,
                           2477,
                           25,
                           2812,
                           2441,
                           273,
                           1847,
                           2256,
                           469,
                           355,
                           332,
                           354,
                           1039,
                           1457,
                           2230,
                           2558,
                           2863,
                           147,
                           2172,
                           689,
                           1632,
                           1817,
                           1049,
                           2808,
                           776,
                           2906,
                           115,
                           828]
    static let march: [Int] = [1060,
                        760,
                        1567,
                        2756,
                        41,
                        941,
                        1753,
                        1570,
                        2285,
                        136,
                        428,
                        2661,
                        812,
                        1235,
                        1058,
                        2490,
                        991,
                        156,
                        1181,
                        1329,
                        2159,
                        1505,
                        1912,
                        1098,
                        2126,
                        818,
                        386,
                        2236,
                        700,
                        551]
    
    static func getDemoArrayMonthlyStatistics () -> [MonthlyStatistic] {
        let january = MonthlyStatistic(monthlyMoneyArray: january, monthName: "january")
        let february = MonthlyStatistic(monthlyMoneyArray: february, monthName: "february")
        let march = MonthlyStatistic(monthlyMoneyArray: march, monthName: "march")
        return [january, february, march]
    }
}

///monthlyArray[0]  = MonthlyStatistic(month: [2960, 1963, 925, 428, 1523, 2368, 553, 62, 1845, 1848, 675, 972, 972, 436, 817, 1241, 821, 615, 799, 2645, 399, 894, 1695, 2482, 2270, 1155, 575, 1579, 478, 885])


//   january, february, march

/*
 [CRM_Analitycs_Dashboard.MonthlyStatistic(month: [2960, 1963, 925, 428, 1523, 2368, 553, 62, 1845, 1848, 675, 972, 972, 436, 817, 1241, 821, 615, 799, 2645, 399, 894, 1695, 2482, 2270, 1155, 575, 1579, 478, 885]),
 CRM_Analitycs_Dashboard.MonthlyStatistic(month: [660, 32, 1688, 2477, 25, 2812, 2441, 273, 1847, 2256, 469, 355, 332, 354, 1039, 1457, 2230, 2558, 2863, 147, 2172, 689, 1632, 1817, 1049, 2808, 776, 2906, 115, 828]),
 CRM_Analitycs_Dashboard.MonthlyStatistic(month: [1060, 760, 1567, 2756, 41, 941, 1753, 1570, 2285, 136, 428, 2661, 812, 1235, 1058, 2490, 991, 156, 1181, 1329, 2159, 1505, 1912, 1098, 2126, 818, 386, 2236, 700, 551])]
 */


///enum months: String
///case january

func makeMonths(){
    
}
