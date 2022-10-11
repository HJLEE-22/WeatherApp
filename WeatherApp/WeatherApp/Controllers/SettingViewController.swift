//
//  SettingViewController.swift
//  WeatherApp
//
//  Created by 이형주 on 2022/10/10.
//

import UIKit

class SettingViewController: UITableViewController {
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - Helpers
    func setupNav() {
        
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationItem.title = "Settings"
        
    }
    
    func setupTableView() {
        
        tableView.register(SettingViewCell.self, forCellReuseIdentifier: cellID.forSettingsCell)
        
        
    }
    
    // MARK: - Datasource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0 :
            return "현재위치정보"
        case 1 :
            return "개인정보 처리방침"
        case 2 :
            return "개발자 정보"
        case 3 :
            return "문의하기"
        default :
            return ""
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID.forSettingsCell, for: indexPath) as! SettingViewCell
        
        if indexPath.section == 0 {
            cell.mainLabel.text = "사용가능"
            cell.switchBtn.isEnabled = true
            
        } else if indexPath.section == 1 {
            cell.mainLabel.text = "hyungjuice@naver.com"
            cell.switchBtn.isHidden = true
        } else if indexPath.section == 2 {
            cell.mainLabel.text = "링크"
            cell.switchBtn.isHidden = true
        } else if indexPath.section == 3 {
            cell.mainLabel.text = "HJLEE"
            cell.switchBtn.isHidden = true
        }
        
        
        return cell

    }
    
    
}
