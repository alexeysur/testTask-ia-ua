//
//  MainViewController+TableViewDataSource.swift
//  BankingApp
//
//  Created by Alexey on 19.08.2021.
//

import UIKit

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transaction.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? OperationCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        
        cell.setupViews()
        cell.dataOperation.text = transaction[indexPath.row].data
        cell.title.text = transaction[indexPath.row].title
        cell.summa.text = transaction[indexPath.row].summa
      
        NSLayoutConstraint.activate([
            cell.dataOperation.centerYAnchor.constraint(equalTo: cell.centerYAnchor),
            cell.dataOperation.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 10),
            cell.dataOperation.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            cell.title.centerYAnchor.constraint(equalTo: cell.centerYAnchor),
            cell.title.centerXAnchor.constraint(equalTo: cell.centerXAnchor),
            cell.title.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            cell.summa.centerYAnchor.constraint(equalTo: cell.centerYAnchor),
            cell.summa.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -20),
            cell.summa.widthAnchor.constraint(equalToConstant: 50)
        ])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .black
      
        let historyLabel = TypeLabel()
        historyLabel.textColor = .black
        historyLabel.backgroundColor = .white
        historyLabel.text = Constants.tableViewHeaderText
   
        historyLabel.textAlignment = .center
        historyLabel.font = UIFont.boldSystemFont(ofSize: 20)
        historyLabel.lineBreakMode = .byTruncatingTail
        historyLabel.translatesAutoresizingMaskIntoConstraints = false
        historyLabel.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        historyLabel.layer.borderWidth = 1
        historyLabel.layer.cornerRadius = 5
        historyLabel.clipsToBounds = true
       
        headerView.addSubview(historyLabel)
        NSLayoutConstraint.activate([
            historyLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            historyLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            historyLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

}
