//
//  UIViewController+Extension.swift
//  TurengTranslateAPI
//
//  Created by Turgay Ceylan on 12.07.2022.
//

import Foundation
import UIKit

extension UIViewController{
    func alert(_ text : String){
        let alert = UIAlertController(title: "Translate alert", message: text, preferredStyle: .alert)
        let okbtn = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okbtn)
        self.present(alert, animated: true, completion: nil)
    }
}
