//
//  appConstans.swift
//  BankingApp
//
//  Created by Alexey on 18.08.2021.


import Foundation

enum Constants {
    static let creditNumber: String = "1234 5678 XXXX XXXX"
    static let creditCardBalans: Double = 40.2
    static let buttonOperationsText: String = "Операции"
    static let tableViewHeaderText: String = "История"
    static let creeditCardКRecipient: String = "Номер карты получателя"
    
    static let sendMoneyButtonTitle: String = "Отправить"
    
}

struct DataOperation {
    let data: String
    let title: String
    let summa: String
    
    static let historyOperations: [DataOperation] = [
        DataOperation(data: "2021-08-01", title: "Пополнение мобильного", summa: "100.0"),
        DataOperation(data: "2021-08-02", title: "Перевод другу", summa: "200.0"),
        DataOperation(data: "2021-08-03", title: "Оплата коммуналки", summa: "300.0"),
        DataOperation(data: "2021-08-04", title: "Благотворительность", summa: "400.0")
    ]
    
}
