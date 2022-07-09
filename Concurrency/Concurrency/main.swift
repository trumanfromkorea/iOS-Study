//
//  main.swift
//  Concurrency
//
//  Created by 장재훈 on 2022/07/08.
//

import Foundation

class BibimbabMaker {
    func make() {
        print("밥 짓기 시작 (15초)")
        
        let group = DispatchGroup()
        
        let background = DispatchQueue(label: "background")
        let main = DispatchQueue(label: "main")
        let queue = DispatchQueue(label: "queue")
        
        
        background.async(group: group) {
            
        }
        
    }
}

let cook = BibimbabMaker()
cook.make()

RunLoop.current.run()
