//
//  ViewController.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 04.01.2022.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet var backView: UIView!
    @IBOutlet weak var registerL: KernLabel!
    @IBOutlet weak var nameTF: UITextField!{
        didSet{
            nameTF.layer.cornerRadius = 4
            nameTF.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFont(name: "Poppins-Regular", size: 18) as Any])
        }
    }
    @IBOutlet weak var emailTF: UITextField!{
        didSet{
            emailTF.layer.cornerRadius = 4
            emailTF.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFont(name: "Poppins-Regular", size: 18) as Any])
        }
    }
    @IBOutlet weak var usernameTF: UITextField!{
        didSet{
            usernameTF.layer.cornerRadius = 4
            usernameTF.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFont(name: "Poppins-Regular", size: 18) as Any])
        }
    }
    @IBOutlet weak var passwordTF: UITextField!{
        didSet{
            passwordTF.layer.cornerRadius = 4
            passwordTF.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFont(name: "Poppins-Regular", size: 18) as Any])
        }
    }
    @IBOutlet weak var confirmPassTF: UITextField!{
        didSet{
            confirmPassTF.layer.cornerRadius = 4
            confirmPassTF.attributedPlaceholder = NSAttributedString(string: "Confirm Password", attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFont(name: "Poppins-Regular", size: 18) as Any])
        }
    }
    @IBOutlet weak var registerBtn: KernButton!{
        didSet{
            registerBtn.layer.cornerRadius = 4
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
}

