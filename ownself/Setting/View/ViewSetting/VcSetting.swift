//
//  VcSetting.swift
//  ownself
//
//  Created by maccli1 on 2017. 12. 5..
//  Copyright © 2017년 myoung. All rights reserved.
//

import UIKit

class VcSetting: UIViewController {

    @IBOutlet weak var tbSetting: UITableView!
    @IBOutlet weak var contNaviHeight: NSLayoutConstraint!
    
    let arrMenuTitle: [String] = ["회고시간 지정하기", "비밀번호 변경하기", "테마 색 지정하기", "테마 폰트 변경하기"]
    
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
        tbSetting.register(UINib(nibName: "CellSetting", bundle: nil), forCellReuseIdentifier: "cell")
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

//MARK: ## UITableview delegate and datasource ##
extension VcSetting: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // Cell Count
        return arrMenuTitle.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { // Cell Height
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {  // Cell Setting
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellSetting
        cell.lbMenuTitle.text = arrMenuTitle[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //셀선택시
        switch arrMenuTitle[indexPath.row] {
        case "회고시간 지정하기": // Setting Retrospect Time
            self.navigationController?.pushViewController(VcSetRetrospectTime(), animated: true)
        case "비밀번호 변경하기": // Change Password
            self.navigationController?.pushViewController(VcSetPassword(), animated: true)
        case "테마 색 지정하기": // Change Theme color
            self.navigationController?.pushViewController(VcSetThemeColor(), animated: true)
        case "테마 폰트 변경하기": // Chagne Theme font
            self.navigationController?.pushViewController(VcSetThemeFont(), animated: true)
        default: break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
