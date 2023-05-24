//
//  UserModel.swift
//  WordsGame
//
//  Created by Никита Попов on 24.05.23.
//

import Foundation


struct UserModel{
    var name: String
    private(set) var score: Int = 0
    
    
    mutating func addPoint(s: Int){
        self.score += s 
    }
}
