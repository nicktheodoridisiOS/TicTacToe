//
//  Alerts.swift
//  TicTacToe
//
//  Created by Nick Theodoridis on 28/9/23.
//

import SwiftUI


struct AlertItem: Identifiable{
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext{
    static let humanWin = AlertItem(title:Text("Congratulations"),
                             message: Text("You won! 🎉 What an impressive victory!"),
                             buttonTitle: Text("Play Again"))
    
    static let aiWin = AlertItem(title:Text("Game Over"),
                             message: Text("You lost! 😔 The AI outsmarted you this time. Keep practicing and you'll improve!"),
                             buttonTitle: Text("Try Again"))
    
    static let draw = AlertItem(title:Text("It's a Draw"),
                             message: Text("The game ended in a draw. 🤝 A well-fought match!"),
                             buttonTitle: Text("Play Again"))
    
    static let humanRound = AlertItem(title:Text("Round For You"),
                             message: Text(""),
                             buttonTitle: Text("Next Round"))
    
    static let aiRound = AlertItem(title:Text("Round For AI"),
                             message: Text(""),
                             buttonTitle: Text("Next Round"))
    
    static let drawRound = AlertItem(title:Text("Draw"),
                             message: Text(""),
                             buttonTitle: Text("Next Round"))
    
    static let firstPlayerWin = AlertItem(title:Text("Congratulations"),
                             message: Text("First player won! 🎉 What an impressive victory!"),
                             buttonTitle: Text("Play Again"))
    
    static let secondPlayerWin = AlertItem(title:Text("Congratulations"),
                                           message: Text("Second player won! 🎉 What an impressive victory!"),
                                           buttonTitle: Text("Play Again"))
    
    static let firstPlayerRound = AlertItem(title:Text("Round For First Player"),
                             message: Text(""),
                             buttonTitle: Text("Next Round"))
    
    static let secondPlayerRound = AlertItem(title:Text("Round For First Player"),
                             message: Text(""),
                             buttonTitle: Text("Next Round"))
    
}
