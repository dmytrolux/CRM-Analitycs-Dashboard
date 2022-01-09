//
//  ViewController.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 04.01.2022.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet var backView: UIView!
    @IBOutlet weak var registerL: UILabel!{
        didSet{
           registerL.attributedText =  NSMutableAttributedString(string: "Register", attributes: [NSAttributedString.Key.kern: 7])
        }
    }
    @IBOutlet weak var nameTF: UITextField!{
        didSet{
            nameTF.layer.cornerRadius = 4
            nameTF.layer.masksToBounds = true
            nameTF.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFont(name: "Poppins-Regular", size: 18) as Any])
        }
    }
    @IBOutlet weak var emailTF: UITextField!{
        didSet{
            emailTF.layer.cornerRadius = 4
            emailTF.layer.masksToBounds = true
            emailTF.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFont(name: "Poppins-Regular", size: 18) as Any])
        }
    }
    @IBOutlet weak var usernameTF: UITextField!{
    didSet{
        usernameTF.layer.cornerRadius = 4
        usernameTF.layer.masksToBounds = true
        usernameTF.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "Poppins-Regular", size: 18) as Any])
    }
    }
    @IBOutlet weak var passwordTF: UITextField!{
        didSet{
            passwordTF.layer.cornerRadius = 4
            passwordTF.layer.masksToBounds = true
            passwordTF.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFont(name: "Poppins-Regular", size: 18) as Any])
        }
    }
    @IBOutlet weak var confirmPassTF: UITextField!{
        didSet{
            confirmPassTF.layer.cornerRadius = 4
            confirmPassTF.layer.masksToBounds = true
            confirmPassTF.attributedPlaceholder = NSAttributedString(string: "Confirm Password", attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFont(name: "Poppins-Regular", size: 18) as Any])
        }
    }
    @IBOutlet weak var registerBtn: KernButton!{
        didSet{
            registerBtn.layer.cornerRadius = 4
            registerBtn.layer.masksToBounds = true
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
    }

}

