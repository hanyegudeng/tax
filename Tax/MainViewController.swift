//
//  MainViewController.swift
//  Tax
//
//  Created by Yun on 2019/1/3.
//  Copyright © 2019 Higgs. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var txtAmount:UITextField!
    @IBOutlet var txtInsurance:UITextField!
    @IBOutlet var txtOther:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationItem.title = "工资计算"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func showResult(){
        let a:Double = Double(txtAmount.text ?? "0") ?? 0
        let i:Double = Double(txtInsurance.text ?? "0") ?? 0
        let o:Double = Double(txtOther.text ?? "0") ?? 0
        if a == 0{
            return
        }
        let tmp = tax(amount: MyAmount(amount: a, insurance: i, other: o))
        let list = ResultListViewController()
        list.list = tmp
        self.navigationController?.pushViewController(list, animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let a:Double = Double(txtAmount.text ?? "0") ?? 0
        if a != 0{
            let tmpG = a > 28014 ? 28014 : a
            let tmpQ = a > 28018 ? 28018 : a
            let rat = tmpG * 0.07 + tmpQ * 0.105
//            txtInsurance.text = "\(Int(rat))"
            txtInsurance.text = String(format: "%.2f", rat);
        }
    }
    
}
