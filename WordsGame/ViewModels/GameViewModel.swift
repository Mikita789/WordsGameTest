//
//  GameViewModels.swift
//  WordsGame
//
//  Created by Никита Попов on 24.05.23.
//

import Foundation

class GameViewModel: ObservableObject{
    @Published var player1: UserModel
    @Published var player2: UserModel
    @Published var wordsArr = [String]()
    
    var gameWord: String
    var isFirstPlayer = true
    
    init(player1: UserModel, player2: UserModel, word: String) {
        self.player1 = player1
        self.player2 = player2
        self.gameWord = word
    }
    
    
    private func wordValidate(word:String)->Bool{
        guard word.lowercased() != self.gameWord.lowercased() else {
            print("это точно такое же слово")
            return false }
        guard word.count >= 3 else {
            print("короткое слово \(word)")
            return false
        }
        guard !(self.wordsArr.contains(word)) else {
            print("такое слово уже было")
            return false }
              
        return true
    }
    
    
    private func checkUserWordInGameWord(userWord: String, globalWord: String)-> Bool{
        let userW = Array(userWord)
        var globW = Array(globalWord.lowercased()  )
        var flag = true
        
        for chr in userW{
            if globW.contains(chr){
                globW.remove(at: globW.firstIndex(of: chr)!)
            } else {
                flag = false
                break
            }
        }
        
        return flag
    }
    
    func getPoints(word: String)->Int{
        guard self.wordValidate(word: word) else { return 0 }
        let globWord = self.gameWord.lowercased()
        
        guard self.checkUserWordInGameWord(userWord: word, globalWord: globWord) else {
            print("Cлово не содержится")
            return 0 }
        self.wordsArr.append(word.lowercased())
        if isFirstPlayer{
            self.player1.addPoint(s: word.count)
        }else{
            self.player2.addPoint(s: word.count)
        }
        self.isFirstPlayer.toggle()
        
        return word.count
        
    }
    
    
}
