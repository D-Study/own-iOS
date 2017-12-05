//
//  VcSetting.swift
//  ownself
//
//  Created by maccli1 on 2017. 12. 5..
//  Copyright © 2017년 myoung. All rights reserved.
//

import UIKit

class VcSetting: UIViewController {

    @IBOutlet weak var contNaviHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNormal()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        initAutolayout()
    }
    
    //MARK: ## init method ##
    func initNormal() { //init normal setting
    }
    
    func initAutolayout() { //init autolayout setting
        if deviceType == "x" {
            contNaviHeight.constant = 94.0
        }
    }
    
    //MARK: ## button method ##
    @IBAction func btnBackB(_ sender: UIButton) { //Back to the Home Page
        self.navigationController?.popViewController(animated: true)
    }
    
}
