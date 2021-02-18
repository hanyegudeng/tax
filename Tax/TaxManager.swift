//
//  TaxManager.swift
//  Tax
//
//  Created by Yun on 2019/1/3.
//  Copyright © 2019 Higgs. All rights reserved.
//

import UIKit

struct MyAmount {
    /// 基本薪
    var amount:Double = 0
    
    /// 扣除4金
    var insurance:Double = 0
    
    /// 其他减项
    var other:Double = 0
    
    init(amount:Double,insurance:Double,other:Double) {
        self.amount = amount
        self.insurance = insurance
        self.other = other
    }
}
struct TaxResult {
    var tax:Double = 0///新的税
    var amount:Double = 0///新的收入
    var oldTax:Double = 0///老的税
    var oldAmount:Double = 0///老的收入
}
//级数      累计预扣预缴应纳税所得额            预扣率        速算扣除数
//1        不超过 36000 元的                 3%            0
//2        超过 36000 元至 144000 元的部分    10%           2520
//3        超过 144000 元至 300000 元的部分   20%           16920
//4        超过 300000 元至 420000 元的部分   25%           31920
//5        超过 420000 元至 660000 元的部分   30%           52920
//6        超过 660000 元至 960000 元的部分   35%           85920
//7        超过 960000 元的部分               45%          181920


/// 获取速扣金额
///
/// - Parameters:
///   - amount: 个人基本工资
///   - mounth: 月份
/// - Returns: 速扣金额
fileprivate func getLeftOverAmount(amount:MyAmount,mounth:Int) ->(rate:Double,sub:Double){
    let tmp = Double(mounth) * (amount.amount - amount.insurance - amount.other - 5000)
    if tmp < 36000{return (0.03,0)}
    else if tmp < 144000{return (0.1,2520)}
    else if tmp < 300000{return (0.2,16920)}
    else if tmp < 420000{return (0.25,31920)}
    else if tmp < 660000{return (0.30,52920)}
    else if tmp < 960000{return (0.35,85920)}
    else {return (0.45,181920)}
}


/// 获取老的税
///
/// - Parameters:
///   - amount: 个人基本工资
///   - mounth: 月份
/// - Returns: 老的速扣金额
fileprivate func getOldLeftOverAmount(amount:MyAmount) ->Double{
    let tmp = amount.amount - amount.insurance - 5000
    if tmp < 3000{return (amount.amount - 3000) * 0.03}
    else if tmp < 12000{return tmp * 0.1 - 210}
    else if tmp < 25000{return tmp * 0.2  - 1410}
    else if tmp < 35000{return tmp * 0.25 - 2660}
    else if tmp < 55000{return tmp * 0.30 - 4410}
    else if tmp < 80000{return tmp * 0.35 - 7160}
    else {return tmp * 0.45 - 15160}
}


func tax(amount:MyAmount) ->[TaxResult]{
    var result:[TaxResult] = [TaxResult]()
    if amount.amount - amount.insurance - amount.other - 5000 <= 0{
        for _ in 1 ..< 13{//不交税
            let tmp = TaxResult(tax: 0,
                      amount: amount.amount - amount.insurance,
                      oldTax: 0,
                      oldAmount: amount.amount - amount.insurance)
            result.append(tmp)
        }
        return result
    }
    var addTax:Double = 0//速减税额
    
    let oldTax = getOldLeftOverAmount(amount: amount)
    let oldAmount = amount.amount - amount.insurance - oldTax
    
    for i in 1 ..< 13{
        let leftOver = getLeftOverAmount(amount: amount, mounth: i)
        let tmp = Double(i) * (amount.amount - amount.insurance - amount.other - 5000) * leftOver.rate - leftOver.sub - addTax
        addTax = addTax + tmp
        let tmpResult = TaxResult(tax: tmp,
                           amount: amount.amount - amount.insurance - tmp,
                           oldTax: oldTax,
                           oldAmount: oldAmount)
        result.append(tmpResult)
    }
    return result
}
