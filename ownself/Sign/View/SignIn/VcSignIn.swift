//
//  VcSignIn.swift
//  ownself
//
//  Created by maccli1 on 2017. 11. 29..
//  Copyright © 2017년 myoung. All rights reserved.
//

import UIKit

class VcSignIn: UIViewController {
   
    @IBOutlet weak var btnStartOwnSelf: UIButton!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var lbDesStatus: UILabel!
    
    var isCheck: (isEmail: Bool, isPass: Bool) = (false, false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSetNormal()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        initAutolayoutView()
    }
    
    //MARK: ## init Method ##
    func initAutolayoutView() { //init Autolayout View
        tfEmail.layer.addBorder([.bottom], color: UIColor.color_one(161.0), thickness: 0.5)
        tfEmail.setBothSidePaddingPoints(10.0)
        
        tfPassword.layer.addBorder([.bottom], color: UIColor.color_one(161.0), thickness: 0.5)
        tfPassword.setBothSidePaddingPoints(10.0)
        
        btnStartOwnSelf.layer.cornerRadius = 4.0
    }
    
    func initSetNormal() { //init normal setting
        tfEmail.becomeFirstResponder()
        btnStartOwnSelf.isUserInteractionEnabled = false
    }
    
    //MARK: ## Button Method ##
    @IBAction func btnBackB(_ sender: UIButton) { //Back button
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnStartOwnSelfB(_ sender: UIButton) { //Start ownself
        view.endEditing(true)        
        guard let email: String = tfEmail.text, email.count != 0 else {
            Toast(message: "올바른 이메일인지 확인해주세요.").show()
            tfEmail.becomeFirstResponder()
            return
        }
        // need Server communication        
        self.present(VcRetrospect(), animated: true, completion: nil)
    }
    
    //MARK: ## TextField Method ##
    @IBAction func tfEmailT(_ sender: UITextField) { //Email check
        guard let email: String = sender.text, email.count != 0 else {
            return
        }
        isCheck.isEmail = email.isValidEmail
        checkEmailAndPassword()
    }
    
    @IBAction func tfPasswordT(_ sender: UITextField) { // Password check
        guard let pass: String = sender.text, pass.count != 0 else {
            return
        }
        isCheck.isPass = pass.count > 5 ? true : false
        checkEmailAndPassword()
    }

    //MARK: ## Etc Method ##
    func checkEmailAndPassword() { // Email and password check, login button is enable when both true
        if isCheck.isEmail && isCheck.isPass {
            lbDesStatus.text = ""
            btnStartOwnSelf.isUserInteractionEnabled = true
            btnStartOwnSelf.backgroundColor = UIColor(red: 0.0/255.0, green: 172.0/255.0, blue: 193.0, alpha: 1.0)
        } else {
            if !isCheck.isEmail {
                lbDesStatus.text = "* 올바른 형식의 이메일을 적어주세요."
            } else if !isCheck.isPass {
                lbDesStatus.text = "* 패스워드는 6글자이상 입니다."
            }
            btnStartOwnSelf.isUserInteractionEnabled = false
            btnStartOwnSelf.backgroundColor = UIColor.color_one(161.0)
        }
    }
    
}
