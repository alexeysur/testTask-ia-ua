//
//  TransferViewController.swift
//  BankingApp
//
//  Created by Alexey on 18.08.2021.
//

import UIKit

enum statusOperation {
    case wrong
    case success
    
}

class TransferViewController: UIViewController {
    
    private let senderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.backgroundColor = UIColor(named: "darkGray")
        label.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        label.layer.borderWidth = 1
        label.sizeToFit()
        
        label.font = UIFont(name: "Rockwell-Bold", size: 14)
        label.text = "Отправитель"
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.clipsToBounds = true
        
        return label
    }()
    
    private let numberCardSender: UILabel = {
        let label = TypeLabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isEnabled = false
        label.text = Constants.creditNumber
      
        label.font = UIFont(name: "Rockwell-Bold", size: 24)
        label.textAlignment = .center
        label.textColor = .black
        label.sizeToFit()
        label.clipsToBounds = true
        label.backgroundColor = .white
        label.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 5
       
        return label
    }()
    
    private let recieverLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.backgroundColor = UIColor(named: "darkGray")
        label.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        label.layer.borderWidth = 1
        label.sizeToFit()
        
        label.font = UIFont(name: "Rockwell-Bold", size: 14)
        label.text = "Получатель"
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.clipsToBounds = true
        
        return label
    }()
    
    private let numberCardReciever: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Номер карты получателя"
        field.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 5
        field.clipsToBounds = true
        field.backgroundColor = .white
        field.keyboardType = .numberPad
        
        field.font = UIFont(name: "Rockwell-Bold", size: 20)
        field.textAlignment = .center
        field.textColor = .black
       
        return field
    }()
    
    private let summaTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "0.0"
        field.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 5
        field.clipsToBounds = true
        field.backgroundColor = .white
        field.keyboardType = .numberPad
        
        field.font = UIFont(name: "Rockwell-Bold", size: 24)
        field.textAlignment = .left
        field.textColor = .black
        
        
        return field
    }()
    
    private let viewBottomOnController: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "separateLine")
        return view
    }()
    
    private let buttonSend: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 5, right: 5)
        
        button.titleLabel?.font = UIFont(name: "Rockwell-Bold", size: 20)
        button.setTitleColor(.black, for: .normal)
        
        button.backgroundColor = .white
        button.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        
        button.setTitle(Constants.sendMoneyButtonTitle, for: .normal)
        button.addTarget(self, action: #selector(sendMoneyTapped), for: .touchUpInside)
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "darkGray")
       // view.backgroundColor = .white
        setupAppearance()
    }
    
    private func setupAppearance() {
        view.addSubview(senderLabel)
        NSLayoutConstraint.activate([
            senderLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            senderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            senderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            senderLabel.heightAnchor.constraint(equalToConstant: 44)
        ])
      
        view.addSubview(numberCardSender)
        NSLayoutConstraint.activate([
            numberCardSender.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numberCardSender.topAnchor.constraint(equalTo: senderLabel.bottomAnchor, constant: 20),
            numberCardSender.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            numberCardSender.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            numberCardSender.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        view.addSubview(recieverLabel)
        NSLayoutConstraint.activate([
            recieverLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recieverLabel.topAnchor.constraint(equalTo: numberCardSender.bottomAnchor, constant: 30),
            recieverLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            recieverLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            recieverLabel.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        view.addSubview(numberCardReciever)
        NSLayoutConstraint.activate([
            numberCardReciever.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numberCardReciever.topAnchor.constraint(equalTo: recieverLabel.bottomAnchor, constant: 20),
            numberCardReciever.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            numberCardReciever.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            numberCardReciever.heightAnchor.constraint(equalToConstant: 100)
        ])
  
        view.addSubview(summaTextField)
        NSLayoutConstraint.activate([
            summaTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            summaTextField.topAnchor.constraint(equalTo: numberCardReciever.bottomAnchor, constant: 20),
            summaTextField.heightAnchor.constraint(equalToConstant: 50),
            summaTextField.widthAnchor.constraint(equalToConstant: 100)
           
        ])
        
        view.addSubview(viewBottomOnController)
        NSLayoutConstraint.activate([
            viewBottomOnController.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewBottomOnController.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            viewBottomOnController.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            viewBottomOnController.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        viewBottomOnController.addSubview(buttonSend)
        NSLayoutConstraint.activate([
            buttonSend.centerXAnchor.constraint(equalTo: viewBottomOnController.centerXAnchor),
            buttonSend.centerYAnchor.constraint(equalTo: viewBottomOnController.centerYAnchor),
            buttonSend.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc func sendMoneyTapped() {
        
        if let summa = Double(summaTextField.text!) {
            if (summa < 1) {
                presentAlert(text: "Сумма перевода не может быть меньше 1.", status: .wrong)
            }
            if (summa >= 1 && summa <= Constants.creditCardBalans) {
                presentAlert(text: "Операция успешна", status: .success)
            }
            
       
        } else {
            presentAlert(text: "Введите корректную сумму", status: .wrong)
        }
        
     
    }
    
    
   private func presentAlert(text: String, status: statusOperation) {
        switch status {
        case .wrong:
            let alert = UIAlertController(title: "Error!", message: text, preferredStyle: .alert)
            let refreshAction = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
            alert.addAction(refreshAction)
            present(alert, animated: true)
        case .success:
            let alert = UIAlertController(title: "Success", message: text, preferredStyle: .alert)
            let refreshAction = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
            alert.addAction(refreshAction)
            present(alert, animated: true)
            
          
            let when = DispatchTime.now() + 3
            DispatchQueue.main.asyncAfter(deadline: when){
              alert.dismiss(animated: true, completion: nil)
              self.navigationController?.popViewController(animated: true)
            }
        }
        
      
    }
   
    private func disMissVC(alert: UIAlertAction!) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
