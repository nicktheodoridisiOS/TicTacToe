//
//  Move.swift
//  TicTacToe
//
//  Created by Nick Theodoridis on 28/9/23.
//

import Foundation
import SwiftUI


enum Player{
    case firstPlayer,secondPlayer ,ai
}

struct Move{
    let player: Player
    let boardIndex: Int
    
    var indicator: some View{
        if(player == .firstPlayer){
            return AnyView(XIndicatorView())
        }
        else if(player == .secondPlayer){
            return AnyView(AOIndicatorView())
        }
        else{
            return AnyView(AIOIndicatorView())
        }
        
        
    }
}
