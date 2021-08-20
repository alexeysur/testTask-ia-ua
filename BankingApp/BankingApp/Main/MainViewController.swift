//
//  ViewController.swift
//  BankingApp
//
//  Created by Alexey on 18.08.2021.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate {
    
    // MARK: - Variables
    var transaction = [DataOperation]()
    
    // MARK: - UI
    
    private let creditCardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        return view
    }()
    
    private let creditCardNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.backgroundColor = .white
        label.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 5
        label.sizeToFit()
        
        label.font = UIFont(name: "Rockwell-Bold", size: 20)
        label.text = Constants.creditNumber
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.clipsToBounds = true
        
        return label
    }()
    
    private let creditCardBalans: TypeLabel = {
        let label = TypeLabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rockwell-Bold", size: 20)
        label.textAlignment = .center
        label.textColor = .black
        label.text = String(Constants.creditCardBalans)
        label.sizeToFit()
        label.clipsToBounds = true
        label.backgroundColor = .white
        label.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 5
        return label
    }()
    
    private let historyOperationsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        return view
    }()
    
    private let viewBottomOnController: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    private let separateLineOnBottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "separateLine")
        return view
    }()
    
    
    private let buttonOperations: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 5, right: 5)
        
        button.titleLabel?.font = UIFont(name: "Rockwell-Bold", size: 20)
        button.setTitleColor(.black, for: .normal)
        
        button.backgroundColor = .white
        button.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        
        button.setTitle(Constants.buttonOperationsText, for: .normal)
        button.addTarget(self, action: #selector(operationsButtonTap), for: .touchUpInside)
        
        
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.historyOperationsView.bounds)
        tableView.register(OperationCell.self, forCellReuseIdentifier: "ItemCell")
        tableView.register(OperationHeader.self, forHeaderFooterViewReuseIdentifier: "CustomTableViewHeader")
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .black
        
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "darkGray")
        
        transaction = DataOperation.historyOperations
        
        setupNavigation()
        setupAppearance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    
    private func setupAppearance() {
        
        creditCardView.frame = CGRect.zero
        view.addSubview(creditCardView)
        
        let widthCard = view.frame.width / 5
        
        NSLayoutConstraint.activate([
            creditCardView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            creditCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            creditCardView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: widthCard),
            creditCardView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -widthCard),
            creditCardView.heightAnchor.constraint(equalToConstant: view.frame.height / 4)
            
        ])
        
        creditCardNumber.frame = CGRect.zero
        creditCardView.addSubview(creditCardNumber)
        
        NSLayoutConstraint.activate([
            creditCardNumber.centerXAnchor.constraint(equalTo: creditCardView.centerXAnchor),
            creditCardNumber.topAnchor.constraint(equalTo: creditCardView.topAnchor, constant: 20),
            creditCardNumber.leadingAnchor.constraint(equalTo: creditCardView.leadingAnchor, constant: 10),
            creditCardNumber.trailingAnchor.constraint(equalTo: creditCardNumber.trailingAnchor, constant: 10),
            creditCardNumber.heightAnchor.constraint(equalToConstant: 40)
            
        ])
        
        view.addSubview(creditCardBalans)
        
        NSLayoutConstraint.activate([
            creditCardBalans.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width / 7.5),
            creditCardBalans.topAnchor.constraint(equalTo: creditCardView.bottomAnchor, constant: 1),
            creditCardBalans.heightAnchor.constraint(equalToConstant: creditCardBalans.bounds.height + 10),
            creditCardBalans.widthAnchor.constraint(equalToConstant: creditCardBalans.bounds.width + 10)
            
        ])
        
        view.addSubview(viewBottomOnController)
        NSLayoutConstraint.activate([
            viewBottomOnController.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewBottomOnController.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            viewBottomOnController.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            viewBottomOnController.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        viewBottomOnController.addSubview(separateLineOnBottomView)
        NSLayoutConstraint.activate([
            separateLineOnBottomView.leadingAnchor.constraint(equalTo: viewBottomOnController.leadingAnchor, constant: 0),
            separateLineOnBottomView.trailingAnchor.constraint(equalTo: viewBottomOnController.trailingAnchor, constant: 0),
            separateLineOnBottomView.topAnchor.constraint(equalTo: viewBottomOnController.topAnchor, constant: 0),
            separateLineOnBottomView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        
        viewBottomOnController.addSubview(buttonOperations)
        NSLayoutConstraint.activate([
            buttonOperations.centerXAnchor.constraint(equalTo: separateLineOnBottomView.centerXAnchor),
            buttonOperations.topAnchor.constraint(equalTo: separateLineOnBottomView.bottomAnchor),
            buttonOperations.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        view.addSubview(historyOperationsView)
        NSLayoutConstraint.activate([
            historyOperationsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            historyOperationsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            historyOperationsView.topAnchor.constraint(equalTo: creditCardBalans.bottomAnchor, constant: 10),
            
            historyOperationsView.bottomAnchor.constraint(equalTo: viewBottomOnController.topAnchor, constant: 0)
        ])
        
        historyOperationsView.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: historyOperationsView.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: historyOperationsView.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: historyOperationsView.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: historyOperationsView.bottomAnchor, constant: 0)
        ])
    }
    
    private func setupNavigation() {
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "darkGray")
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        self.title = "Главная"
        let attributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 20)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        
    }
    
    
    @objc private func operationsButtonTap() {
        let vc = TransferViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

