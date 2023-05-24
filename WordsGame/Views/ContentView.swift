//
//  ContentView.swift
//  WordsGame
//
//  Created by Никита Попов on 23.05.23.
//

import SwiftUI

struct ContentView: View {
    @State private var wordTF = ""
    @State private var player1TF = ""
    @State private var player2TF = ""
    
    @State private var isStartGame = false
    
    var body: some View {
        VStack {
            Text("Words Game")
                .foregroundColor(.white)
                .font(.system(size: 40, design: .monospaced))
                .frame(maxWidth: .infinity, maxHeight: 100)
                .background(.red)
                .cornerRadius(50)
                .padding()
            
            TextField("Введите слово", text: $wordTF)
                .padding()
                .background(.white)
                .cornerRadius(30)
                .padding(.bottom, 50)
            
            
            VStack(spacing: 20) {
                TextField("Игрок 1 ", text: $player1TF)
                    .padding()
                    .background(.white)
                    .cornerRadius(30)
                
                
                TextField("Игрок 1 ", text: $player2TF)
                    .padding()
                    .foregroundColor(.white)
                    .background(.white)
                    .cornerRadius(30)
            }
            
            Button {
                isStartGame.toggle()
            } label: {
                Text("Start!")
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .foregroundColor(.white)
            .background(.green)
            .cornerRadius(50)
            .clipShape(Capsule())
            .padding(45)
            .fullScreenCover(isPresented: $isStartGame) {
                let pl1 = UserModel(name: player1TF)
                let pl2 = UserModel(name: player2TF)
                GameView(viewModel: GameViewModel(player1: pl1, player2: pl2, word: wordTF))
            }

            
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))

        
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
