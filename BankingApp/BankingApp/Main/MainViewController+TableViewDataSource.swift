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
        cell.textLabel?.text = transaction[indexPath.row].title
        cell.detailTextLabel?.text = transaction[indexPath.row].data
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableCell(withIdentifier: "headerCell") as? OperationHeader else {
            return UITableViewHeaderFooterView()
        }
        let backgroundView = UIView(frame: headerView.bounds)
        backgroundView.backgroundColor = .black
        headerView.backgroundView = backgroundView
        
        return headerView
    }
    
    
}
