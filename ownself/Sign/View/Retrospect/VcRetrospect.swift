//
//  VcRetrospect.swift
//  ownself
//
//  Created by maccli1 on 2017. 12. 4..
//  Copyright © 2017년 myoung. All rights reserved.
//

import UIKit
import SCPageControl

class VcRetrospect: UIViewController {

    // guide and retrospect time view
    @IBOutlet weak var scGuidePage: UIScrollView!
    @IBOutlet weak var scPageControl: SCPageControlView!
    @IBOutlet weak var dtRetrospect: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNormal()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    //MARK: ## init Method ##
    func initNormal() { // init normal setting        
        dtRetrospect.locale = Locale(identifier: "ko_KR")
        
        scPageControl.frame = CGRect(x: 0, y: screenHeight-50, width: screenWidth, height: 50)
        scPageControl.scp_style = .SCNormal
        scPageControl.set_view(3, current: 0, tint_color: .red)
    }
    
    //MARK: ## Button Method ##
    @IBAction func btnStartOwnSelfB(_ sender: UIButton) { // start ownSelf
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "hhmmss"
        printa(dateFormat.string(from: dtRetrospect.date))
    }
}

//MARK: UIScrollView Delegate
extension VcRetrospect: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.x > 750 {
            scPageControl.isHidden = true
        } else {
            scPageControl.isHidden = false
        }
        
        scPageControl.scroll_did(scGuidePage)
    }
    
}
