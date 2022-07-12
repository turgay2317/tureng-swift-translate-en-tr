//
//  TranslateService.swift
//  TurengTranslateAPI
//
//  Created by Turgay Ceylan on 12.07.2022.
//

import Foundation
import SwiftSoup

class TranslateService{
    
    private static let url : String = "https://tureng.com/tr/turkce-ingilizce/"
    
    static func translate(_ word : String, limit : Int? = 100) -> String{
        if let url = URL(string: url + word) {
            do {
                let contents = try String(contentsOf: url)
                let doc = try SwiftSoup.parse(contents)
                let table = try doc.select("table").first()
                let tds = try table?.select("td")
                var means : String = ""
                var counter : Int = 0
                
                tds?.forEach { td in
                    if td.hasClass("tr ts"){
                        if counter < limit! {
                            try? means += String(format: "%@ \n", td.text())
                            counter += 1
                        }
                    }
                }
                return means.isEmpty == false ? means : "Sonuç bulunamadı"
            } catch {
                return "Bir hata oluştu"
            }
        } else {
            return "URL'e ulaşılamıyor"
        }
    }
}
