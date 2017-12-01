//
//  VcSignUp.swift
//  ownself
//
//  Created by maccli1 on 2017. 11. 29..
//  Copyright © 2017년 myoung. All rights reserved.
//

import UIKit

class VcSignUp: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var lbDesEmail: UILabel!
    @IBOutlet weak var btnSignUp: UIButton!
    
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
        
        btnSignUp.layer.cornerRadius = 4.0
    }
    
    func initSetNormal() { //init normal setting
        tfEmail.becomeFirstResponder()
        btnSignUp.isUserInteractionEnabled = false
    }
    
    //MARK: ## Button Method ##
    @IBAction func btnBackB(_ sender: UIButton) { // Back Button
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSignUPB(_ sender: UIButton) { // signUp Button
        view.endEditing(true)
        printa("here")
        guard let email: String = tfEmail.text, email.count != 0 else {
            Toast(message: "올바른 이메일인지 확인해주세요.").show()
            tfEmail.becomeFirstResponder()
            return
        }
        // need Server communication
        
    }
    
    //MARK: ## TextField Method ##
    @IBAction func tfEmailT(_ sender: UITextField) {
        guard let email: String = sender.text, email.count != 0 else {
            return
        }
        if email.isValidEmail {
            lbDesEmail.text = ""
            btnSignUp.isUserInteractionEnabled = true
            btnSignUp.backgroundColor = UIColor(red: 0.0/255.0, green: 172.0/255.0, blue: 193.0, alpha: 1.0)
        } else {
            lbDesEmail.text = "* 올바른 형식의 이메일을 적어주세요."
            btnSignUp.isUserInteractionEnabled = false
            btnSignUp.backgroundColor = UIColor.color_one(161.0)
        }
    }
}
