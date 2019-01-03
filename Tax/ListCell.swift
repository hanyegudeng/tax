//
//  ListCell.swift
//  Tax
//
//  Created by Yun on 2019/1/3.
//  Copyright © 2019 Higgs. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet var labMonth:UILabel!
    @IBOutlet var labLeft:UILabel!
    @IBOutlet var labRight:UILabel!
    
    @IBOutlet var labOldAmount:UILabel!
    @IBOutlet var labOldTax:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    
    func setCellDataSource(amount:TaxResult,index:Int) {
        labLeft.text = "\(Int(amount.amount))"
        labRight.text = "\(Int(amount.tax))"
        labMonth.text = "\(index)月"
        labOldTax.text = "\(Int(amount.oldTax))"
        labOldAmount.text = "\(Int(amount.oldAmount))"
    }
    
}
