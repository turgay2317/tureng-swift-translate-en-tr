//
//  ViewController.swift
//  TurengTranslateAPI
//
//  Created by Turgay Ceylan on 12.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let textBox : UITextField = {
        let textbox = UITextField()
        textbox.translatesAutoresizingMaskIntoConstraints = false
        textbox.placeholder = "Kelime giriniz"
        textbox.borderStyle = .roundedRect
        textbox.backgroundColor = .white
        return textbox
    }()
    
    let button : UIButton = {
        let btn = UIButton()
        btn.setTitle("Çevir", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .black
        btn.tintColor = .white
        return btn
    }()
    
    var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Tureng Translate App"
        label.textColor = .red
        label.font = UIFont(name: "Arial", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Birkaç stil operasyonu */
        view.backgroundColor = .lightGray
        
        view.addSubview(textBox)
        textBox.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textBox.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textBox.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: textBox.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: textBox.centerYAnchor, constant: 40).isActive = true
        button.widthAnchor.constraint(equalTo: textBox.widthAnchor).isActive = true
        
        view.addSubview(titleLabel)
        titleLabel.centerYAnchor.constraint(equalTo: textBox.centerYAnchor, constant: -30).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: textBox.centerXAnchor).isActive = true
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(wordVC))
        
        /* OnClick eventi */
        button.addTarget(self, action: #selector(translateClick), for: .touchDown)

    }
    
    @objc func translateClick() -> Void{
        /* Translate servisi kullanım */
        if let textBoxValue = textBox.text {
            let result = TranslateService.translate(textBoxValue)
            alert(result)
        }else{
            alert("Lütfen geçerli bir ifade giriniz")
        }
    }
    
    @objc func wordVC(){
        performSegue(withIdentifier: "wordSegue", sender: nil)
    }
}

