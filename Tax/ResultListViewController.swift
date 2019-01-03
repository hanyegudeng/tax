//
//  ResultListViewController.swift
//  Tax
//
//  Created by Yun on 2019/1/3.
//  Copyright © 2019 Higgs. All rights reserved.
//

import UIKit

class ResultListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var list:[TaxResult]!
    var headerView:ListHeaderDetailView = ListHeaderDetailView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tb = UITableView(frame: self.view.bounds)
        tb.delegate = self
        tb.dataSource = self
        view.addSubview(tb)
        tb.register(UINib.init(nibName: "ListCell", bundle:nil), forCellReuseIdentifier: "ListCell")
        tb.rowHeight = 60
        title = "工资明细"
        tb.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "Header")
        tb.tableHeaderView = headerView
        headerView.setUpDataSource(dataSource: list)
    }
    
    // MARK: - TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ListCell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! ListCell
        cell.setCellDataSource(amount: list[indexPath.row],index:indexPath.row + 1)
        return cell
     }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let h = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header")
        var lab:UILabel? = h?.viewWithTag(100) as? UILabel
        if lab == nil{
            lab = UILabel()
            let labCenter = UILabel()
            let labRight = UILabel()
            lab?.text = "月份"
            labCenter.text = "到手(新/旧)"
            labRight.text = "税(新/旧)"
            h?.addSubview(lab!)
            h?.addSubview(labCenter)
            h?.addSubview(labRight)
            labCenter.textAlignment = .center
            labRight.textAlignment = .right
            let width = (view.bounds.width - 20) * 0.33
            lab?.frame = CGRect(x: 10, y: 0, width: width, height: 40)
            labCenter.frame = CGRect(x: width + 10, y: 0, width: width, height: 40)
            labRight.frame = CGRect(x: width * 2 + 10, y: 0, width: width, height: 40)
        }
        return h
    }
    

}
