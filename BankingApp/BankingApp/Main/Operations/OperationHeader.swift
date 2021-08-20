//
//  OperationHeader.swift
//  BankingApp
//
//  Created by Alexey on 19.08.2021.
//

import UIKit

class OperationHeader: UITableViewHeaderFooterView {

    var title: TypeLabel = {
        let v = TypeLabel()
        v.textColor = .white
        v.text = Constants.tableViewHeaderText
        v.sizeToFit()
        v.font = UIFont(name: "Rockwell-Regular", size: 18)
        v.lineBreakMode = .byTruncatingTail
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
   required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
  
    func setupViews() {
        self.backgroundColor = .black
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.addSubview(title)
        
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            title.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            title.widthAnchor.constraint(equalToConstant: 100)
        ])
 
    }
}
