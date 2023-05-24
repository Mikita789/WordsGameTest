//
//  GameView.swift
//  WordsGame
//
//  Created by Никита Попов on 23.05.23.
//

import SwiftUI

struct GameView: View {
    @State private var isFocusPlayer1 = true
    @State private var userWord = ""
    
    @ObservedObject var viewModel: GameViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        GeometryReader { sc in
            VStack(alignment: .leading){
                HStack{
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Выход")
                    }.padding()
                        .foregroundColor(.black)
                        .background(Color(#colorLiteral(red: 0.9679564834, green: 0.6469489932, blue: 0.5396013856, alpha: 1)))
                        .cornerRadius(20)
                        .padding()
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text(viewModel.gameWord).font(.system(size: 30))
                        .padding(.horizontal, 30)
                        .lineLimit(1)
                    .background()
                    Spacer()
                }
                
                //карточки игроков
                HStack (spacing: 15){
                    VStack{
                        Text("\(viewModel.player1.score)")
                            .font(.system(size: 40))
                        Text(viewModel.player1.name).font(.system(size: 45))
                            
                    }
                    .frame(maxWidth: sc.size.width/2, maxHeight: sc.size.width/2)
                    .background(viewModel.isFirstPlayer ? Color("FocusUser") : Color("NotFocusUser"))
                    .cornerRadius(40)

                    VStack{
                        Text("\(viewModel.player2.score)")
                            .font(.system(size: 40))
                        Text(viewModel.player2.name).font(.system(size: 45))
                    }
                    .frame(maxWidth: sc.size.width/2, maxHeight: sc.size.width/2)
                    .background(!viewModel.isFirstPlayer ? Color("FocusUser") : Color("NotFocusUser"))
                    .cornerRadius(40)

                }
                .padding()
                
                TextField("Введие слово", text: $userWord)
                    .font(.system(size: 30))
                    .multilineTextAlignment(.center)
                    .padding()
                    .cornerRadius(20)
                
                
                
                HStack{
                    Spacer()
                    
                    Button {
                        //validate word
                        viewModel.getPoints(word: userWord.lowercased())
                        self.userWord = ""
                    } label: {
                        Text("Проверить")
                        
                    }
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(#colorLiteral(red: 0.9678551555, green: 0.6487832665, blue: 0.5411915183, alpha: 1)))
                    .clipShape(Capsule())
                    Spacer()

                }

                
               
                
                Spacer()
            }
        }
        

    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel(player1: UserModel(name: "Олег"), player2: UserModel(name: "Никита"), word: "мультивселенная"))
    }
}
