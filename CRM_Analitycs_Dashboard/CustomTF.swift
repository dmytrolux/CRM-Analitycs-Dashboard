//
//  CustomTF.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 04.01.2022.
//

import UIKit

class CustomTF: UITextField {
    /*
    var namePlaceHolder : String
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
    
    init(namePlaceHolder : String){
        self.namePlaceHolder = namePlaceHolder
        assignCustomFontAndNameTF()
    }
    
    required init?(coder: NSCoder) {
    
           super.init(coder: coder)
        self.namePlaceHolder = namePlaceHolder
        }

    /*
    //let textTF: String
    
    var namePlaceHolder : String
    
      init(namePlaceHolder: String) {
          super.init(self.namePlaceHolder = namePlaceHolder)
    }
   
    */
    
    
    private func assignCustomFontAndNameTF() {
   
    self.attributedPlaceholder = NSAttributedString(
        string: "Name", attributes: [
        .foregroundColor: UIColor.white,
        .font: UIFont(name: namePlaceHolder , size: 18) as Any])
    }
     
     
     
     /*
}


      }*/*/
}
