//
//  ListHeaderDetailView.swift
//  Tax
//
//  Created by Yun on 2019/1/3.
//  Copyright © 2019 Higgs. All rights reserved.
//

import UIKit

class ListHeaderDetailView: UIView {

    private let labNewAllAmount:UILabel = UILabel()
    private let labOldAllAmount:UILabel = UILabel()
    private let labNewTax:UILabel = UILabel()
    private let labOldTax:UILabel = UILabel()
    private let labMessage:UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpUI() {
        addSubview(labNewAllAmount)
        addSubview(labOldAllAmount)
        addSubview(labNewTax)
        addSubview(labOldTax)
        addSubview(labMessage)
        let width = bounds.width
        labMessage.frame = CGRect(x: 10, y: 10, width: width - 20, height: 20)
        labNewAllAmount.frame = CGRect(x: 10, y: 40, width: width * 0.5 - 10, height: 20)
        labOldAllAmount.frame = CGRect(x: 10, y: 70, width: width * 0.5 - 10, height: 20)
        labNewTax.frame = CGRect(x: width * 0.5, y: 40, width: width * 0.5 - 10, height: 20)
        labOldTax.frame = CGRect(x: width * 0.5, y: 70, width: width * 0.5 - 10, height: 20)
        labNewTax.textAlignment = .right
        labOldTax.textAlignment = .right
        labMessage.textAlignment = .center
    }
    
    private func setLabelColor(lab:UILabel) {
        lab.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        lab.font = UIFont.systemFont(ofSize: 16)
    }
    
    func setUpDataSource(dataSource:[TaxResult]) {
        var newAllAmount:Double = 0
        var newAllTax:Double = 0
        var oldAllAmount:Double = 0
        var oldAllTax:Double = 0
        for item in dataSource{
            newAllAmount += item.amount
            newAllTax += item.tax
            oldAllAmount += item.oldAmount
            oldAllTax += item.oldTax
        }
        labNewAllAmount.text = "新收入：\(Int(newAllAmount))"
        labNewTax.text = "新税：\(Int(newAllTax))"
        labOldAllAmount.text = "旧收入：\(Int(oldAllAmount))"
        labOldTax.text = "旧税：\(Int(oldAllTax))"
        if newAllAmount >= oldAllAmount{
            labMessage.text = "恭喜你，赚了\(Int(newAllAmount - oldAllAmount))"
            labMessage.textColor = #colorLiteral(red: 0.8688190579, green: 0.3278953433, blue: 0.2576764524, alpha: 1)
        }else{
            labMessage.text = "不好意思，亏了\(Int(oldAllAmount - newAllAmount))"
            labMessage.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        }
    }

}
