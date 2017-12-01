//
//  VcIntro.swift
//  ownself
//
//  Created by maccli1 on 2017. 11. 28..
//  Copyright © 2017년 myoung. All rights reserved.
//

import UIKit

class VcIntro: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: ## Button Method ##
    @IBAction func btnSignUpB(_ sender: UIButton) { // sign up
        self.navigationController?.pushViewController(VcSignUp(), animated: true)
    }
    
    @IBAction func btnSignInB(_ sender: UIButton) { // sign in
        self.navigationController?.pushViewController(VcSignIn(), animated: true)
    }
    
    @IBAction func btnNonSignB(_ sender: UIButton) { // signIn by non-Member
        // non-Member is not save data when remove app
        let alert = UIAlertController(title: "알림",
                                      message: "비회원으로 로그인시 앱이 삭제 되면 기록했던 정보가 소실됩니다. 회원가입을 하시면 정보는 안전하게 저장되어 핸드폰을 바꿔도 사용 하실수 있습니다.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "취소", style: .destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "계속하기", style: .default, handler: { _ in
            defaults.set("nonMember", forKey: "isSign")
            defaults.synchronize()
            
            let navigat = UINavigationController()
            navigat.pushViewController(VcHome(), animated: true)
            if let window = self.view.window {
                window.backgroundColor = UIColor.white
                window.rootViewController = navigat
                window.makeKeyAndVisible()
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
