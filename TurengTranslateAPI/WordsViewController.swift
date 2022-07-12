//
//  WordsViewController.swift
//  TurengTranslateAPI
//
//  Created by Turgay Ceylan on 12.07.2022.
//

import UIKit

class WordsViewController: UIViewController {

    private var words : [String] = []
    private var x = 50
    private var y = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadParagraph()
        
        for (index,word) in words.enumerated() {
            let btn = UIButton()
            btn.setTitle(word, for: .normal)
            btn.backgroundColor = .white
            btn.setTitleColor(.black, for: .normal)
            btn.frame = CGRect(x: self.x, y: self.y, width: word.count * 15, height: 30)
            if self.x + (word.count * 15) + 40 > Int(self.view.bounds.width) {
                // alt satıra in
                self.y += 30
                self.x = 50
            }else{
                self.x += (word.count * 15) + 6
            }
            btn.tag = index
            btn.addTarget(self, action: #selector(clickWord), for: .touchDown)
            view.addSubview(btn)
        }
    }
    
    @objc func clickWord(sender : UIButton){
        /* Translate servisi (anlam sayısını 5 ile limitlendirdik) */
        alert(TranslateService.translate(words[sender.tag], limit: 5))
    }
    
    private func loadParagraph(){
        words.append("Hi")
        words.append("I")
        words.append("live")
        words.append("in")
        words.append("London")
        words.append("I")
        words.append("have")
        words.append("a")
        words.append("black")
        words.append("car")
    }


}
