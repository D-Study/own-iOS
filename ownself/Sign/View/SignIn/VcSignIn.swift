//
//  VcSignIn.swift
//  ownself
//
//  Created by maccli1 on 2017. 11. 29..
//  Copyright © 2017년 myoung. All rights reserved.
//

import UIKit

class VcSignIn: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: ## Button Method ##
    @IBAction func btnBackB(_ sender: UIButton) { //Back button
        self.navigationController?.popViewController(animated: true)
    
    }
    

}
