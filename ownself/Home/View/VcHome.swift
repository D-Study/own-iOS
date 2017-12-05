//
//  VcHome.swift
//  ownself
//
//  Created by maccli1 on 2017. 11. 28..
//  Copyright © 2017년 myoung. All rights reserved.
//

import UIKit

class VcHome: UIViewController {

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
        initAutoLayout()
    }
    
    //MARK: ## init method ##
    func initNormal() { // init normal setting
        
        self.navigationController?.isNavigationBarHidden = true
        UIApplication.shared.isStatusBarHidden = false
        
    }
    
    func initAutoLayout() { //init autolayout
        if deviceType == "x" {
            contNaviHeight.constant = 94.0
        }
    }
    
    //MARK: ## button method ##
    @IBAction func btnSettingB(_ sender: UIButton) { // Go to the setting page
        self.navigationController?.pushViewController(VcSetting(), animated: true)
    }
}
