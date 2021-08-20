//
//  OperationCell.swift
//  BankingApp
//
//  Created by Alexey on 19.08.2021.
//

import UIKit

class OperationCell: UITableViewCell {
    
    var dataOperation: TypeLabel = {
        let v = TypeLabel()
        v.textColor = .white
        v.font = UIFont(name: "Rockwell-Regular", size: 10)
        v.lineBreakMode = .byTruncatingTail
        v.translatesAutoresizingMaskIntoConstraints = false
        v.sizeToFit()
        return v
    }()
    
    
    var title: TypeLabel = {
        let v = TypeLabel()
        v.textColor = .white
        v.font = UIFont(name: "Rockwell-Regular", size: 12)
        v.lineBreakMode = .byTruncatingTail
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var summa: TypeLabel = {
        let v = TypeLabel()
        v.textColor = .white
        v.font = UIFont(name: "Rockwell-Bold", size: 12)
        v.lineBreakMode = .byTruncatingTail
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupViews() {
        self.backgroundColor = .black
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        
        self.addSubview(dataOperation)
        self.addSubview(title)
        self.addSubview(summa)
    }
    
}
