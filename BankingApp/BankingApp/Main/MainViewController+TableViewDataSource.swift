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
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomTableViewHeader") as? OperationHeader else {
            return UITableViewHeaderFooterView()
        }
        let backgroundView = UIView(frame: headerView.bounds)
        backgroundView.backgroundColor = .black
        headerView.backgroundView = backgroundView
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Constants.tableViewHeaderText
    }
}
