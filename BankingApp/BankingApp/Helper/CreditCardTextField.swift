//
//  CreditCardTextField.swift
//  BankingApp
//
//  Created by Alexey on 20.08.2021.
//

import UIKit

class CreditCardTextField: UITextField {
    public var errorColor: UIColor?
    public var errorMessage: String?
    public var previousTextFieldContent: String?
    public var previousSelection: UITextRange?
    public var mininumCountOfChar: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupObservers()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setupObservers() {
        self.addTarget(self, action: #selector(formatAsCardNumber), for: [.editingChanged, .valueChanged])
 //       self.addTarget(self, action: #selector(textFieldReturnButton), for: .editingDidEndOnExit)
    }
    
    @objc func formatAsCardNumber(textField: UITextField) {
        var targetCursorPosition = 0
        if let startPosition = textField.selectedTextRange?.start {
            targetCursorPosition = textField.offset(from: textField.beginningOfDocument, to: startPosition)
        }
        
        var cardNumberWithoutSpaces = ""
        if let text = textField.text {
            cardNumberWithoutSpaces = removeNonDigits(string: text, andPreserveCursorPosition: &targetCursorPosition)
        }
        
        guard let text = textField.text, let minChars = mininumCountOfChar else { return }
        
        if text.count <= minChars + (minChars / 4) - 1 {
            errorMessage = "The credit card must have " + String(minChars) + " digits"
        } else {
            errorMessage = nil
            textField.text = previousTextFieldContent
            textField.selectedTextRange = previousSelection
            return
        }
        
        if text.count == minChars + (minChars / 4) - 1 {
            errorMessage = nil
        }
        
        let cardNumberWithSpaces = insertCreditCardSpaces(cardNumberWithoutSpaces, preserveCursorPosition: &targetCursorPosition)
        textField.text = cardNumberWithSpaces
        
        if let targetPosition = textField.position(from: textField.beginningOfDocument, offset: targetCursorPosition) {
            textField.selectedTextRange = textField.textRange(from: targetPosition, to: targetPosition)
        }
        
        previousTextFieldContent = textField.text
        previousSelection = textField.selectedTextRange
        
    }
    
    func removeNonDigits(string: String, andPreserveCursorPosition cursorPosition: inout Int) -> String {
        var digitsOnlyString = ""
        let originalCursorPosition = cursorPosition
        
        for i in Swift.stride(from: 0, to: string.count, by: 1) {
            let characterToAdd = string[string.index(string.startIndex, offsetBy: i)]
            if characterToAdd >= "0" && characterToAdd <= "9" {
                digitsOnlyString.append(characterToAdd)
            }
            else if i < originalCursorPosition {
                cursorPosition -= 1
            }
        }
        
        return digitsOnlyString
    }
    
    func insertCreditCardSpaces(_ string: String, preserveCursorPosition cursorPosition: inout Int) -> String {
        var stringWithAddedSpaces = ""
        let cursorPositionInSpacelessString = cursorPosition
        
        for i in 0..<string.count {
            let needs4444Spacing = (i > 0 && (i % 4) == 0)
            
            if needs4444Spacing == true {
                stringWithAddedSpaces.append(" ")
                
                if i < cursorPositionInSpacelessString {
                    cursorPosition += 1
                }
            }
            
            let characterToAdd = string[string.index(string.startIndex, offsetBy:i)]
            stringWithAddedSpaces.append(characterToAdd)
        }
        
        return stringWithAddedSpaces
    }
}
