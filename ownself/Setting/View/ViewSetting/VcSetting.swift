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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //갯수
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //높이
        return 45
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {  //셀 셋팅
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellSetting
        
        cell.textLabel?.text = "a"
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //셀선택시
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    
    
}
