//
//  VcSetRetrospectTime.swift
//  ownself
//
//  Created by maccli1 on 2017. 12. 7..
//  Copyright © 2017년 myoung. All rights reserved.
//

import UIKit

class VcSetRetrospectTime: UIViewController {

    
    @IBOutlet weak var dtRetrospectTime: UIDatePicker!
    @IBOutlet weak var contNaviHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNormalSet()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        initAutolayout()
    }

    //MARK: ## init Method ##
    func initAutolayout() { // init Autolayout
        if deviceType == "x" {
            contNaviHeight.constant = 94.0
        }
    }
    
    func initNormalSet() { // init Normla Setting
        //MARK: Note
        // - if already using retrospect time then set using retrospect time for datepicker
        
    }
    
    //MARK: ## Button Method ##
    @IBAction func btnBackB(_ sender: UIButton) { // Back to the Setting
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnChangeTimeB(_ sender: UIButton) { // Change Retrospect Time
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "hhmmss"
        printa(dateFormat.string(from: dtRetrospectTime.date))
    }

}
