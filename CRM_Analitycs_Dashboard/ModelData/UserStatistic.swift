//
//  StructTotalUser.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 06.01.2022.
//

import Foundation
import UIKit

struct UsersStatistic {
    var targetUsersCount: Int //2000
    var totalUsersCount: Int  //1000
    var lessUsersCount: Int {
        targetUsersCount - totalUsersCount
    }
    var percent: Int {
        Int(100.0 / (Double(targetUsersCount) / Double(totalUsersCount)))
    }

    static func getDemoArrayUserStatistics () -> [UsersStatistic] {
        let p1 = UsersStatistic(targetUsersCount: 2000, totalUsersCount: 1000)
        let p2 = UsersStatistic(targetUsersCount: 3200, totalUsersCount: 1430)
        let p3 = UsersStatistic(targetUsersCount: 2700, totalUsersCount: 2200)
        let p4 = UsersStatistic(targetUsersCount: 3250, totalUsersCount: 2220)
        let p5 = UsersStatistic(targetUsersCount: 5345, totalUsersCount: 3287)
        return [p1, p2, p3, p4, p5]
        
    }
}
