//
//  UserTotalDelegate.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 09.01.2022.
//

import UIKit

protocol UserTotalDelegate: AnyObject {
    func update(target: Double, less: Double)
}

