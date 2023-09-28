//
//  AIViewModel.swift
//  TicTacToe
//
//  Created by Nick Theodoridis on 28/9/23.
//

import SwiftUI

final class AIViewModel: ObservableObject{
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    
    @Published var moves: [Move?] = Array(repeating: nil, count: 9)
    @Published var isGameBoardDisabled: Bool  = false
    @Published var alertItem: AlertItem?
    
    @Published var currentRound = 0
    @Published var humanScore = 0
    @Published var aiScore = 0
    
    @Published var humanTurn: Bool  = false
    @Published var aiTurn: Bool  = false
    
    
    func processPlayerMove(for position: Int , roundSelectedOption: Int){
        aiTurn = true
        humanTurn = false
        if(isSquareOccupied(in: moves, forIndex: position)) {return}
        moves[position] = Move(player: .firstPlayer, boardIndex: position)
        
        print("\(currentRound) of \(roundSelectedOption)")
        print(humanScore)
        print(aiScore)
        
        // Win / Draw Condition
        
        if checkWinCondition(for: .firstPlayer, in: moves){
            humanScore = humanScore + 1
            if(roundSelectedOption == currentRound){
                if(humanScore > aiScore){
                    alertItem = AlertContext.humanWin
                    resetScore()
                    return
                }
                else if(humanScore < aiScore){
                    alertItem = AlertContext.aiWin
                    resetScore()
                    return
                }
                else{
                    alertItem = AlertContext.draw
                    resetScore()
                    return
                }
            }
            currentRound = currentRound + 1
            alertItem = AlertContext.humanRound
            return
        }
        
        
        if checkForDraw(in: moves){
            if(roundSelectedOption == currentRound){
                if(humanScore > aiScore){
                    alertItem = AlertContext.humanWin
                    resetScore()
                    return
                }
                else if(humanScore < aiScore){
                    alertItem = AlertContext.aiWin
                    resetScore()
                    return
                }
                else{
                    alertItem = AlertContext.draw
                    resetScore()
                    return
                }
            }
            currentRound = currentRound + 1
            alertItem = AlertContext.drawRound
            return
        }
        
        isGameBoardDisabled = true
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){ [self] in
            let aiPosition = determineMovePosition(in: moves)
            moves[aiPosition] = Move(player: .ai, boardIndex: aiPosition)
            isGameBoardDisabled = false
            
            
            if checkWinCondition(for: .ai, in: moves){
                aiScore = aiScore + 1
                if(roundSelectedOption == currentRound){
                    if(humanScore > aiScore){
                        alertItem = AlertContext.humanWin
                        resetScore()
                        return
                    }
                    else if(humanScore < aiScore){
                        alertItem = AlertContext.aiWin
                        resetScore()
                        return
                    }
                    else{
                        alertItem = AlertContext.draw
                        resetScore()
                        return
                    }
                }
                currentRound = currentRound + 1
                alertItem = AlertContext.aiRound
                return
                
                
            }
            
            if checkForDraw(in: moves){
                alertItem = AlertContext.draw
                return
            }
            
        }
    }
    
    
    func isSquareOccupied(in moves: [Move?], forIndex index: Int ) -> Bool{
        return moves.contains(where: {$0?.boardIndex == index})
    }
    
    func resetScore(){
        humanScore = 0
        aiScore = 0
        currentRound = 0
    }
    
    func determineMovePosition(in moves: [Move?]) -> Int{
        let winPatterns: Set<Set<Int>> = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
        
        aiTurn.toggle()
        humanTurn.toggle()
        
        //Easy Mode
        let aiMoves = moves.compactMap{$0}.filter{ $0.player == .ai} // Removing nil from array and keep the player's move array's index
        let aiPosition = Set(aiMoves.map{$0.boardIndex}) // Give me the board indexed from player's array
        
        for pattern in winPatterns {
            let  winPosition = pattern.subtracting(aiPosition)
            
            if winPosition.count == 1 {
                let isAvailable = !isSquareOccupied(in: moves, forIndex: winPosition.first!)
                if isAvailable {return winPosition.first!}
            }
        }
        
        //Medium Mode
        let humanMoves = moves.compactMap{$0}.filter{ $0.player == .firstPlayer} // Removing nil from array and keep the player's move array's index
        let humanPosition = Set(humanMoves.map{$0.boardIndex}) // Give me the board indexed from player's array
        
        for pattern in winPatterns {
            let  winPosition = pattern.subtracting(humanPosition)
            
            if winPosition.count == 1 {
                let isAvailable = !isSquareOccupied(in: moves, forIndex: winPosition.first!)
                if isAvailable {return winPosition.first!}
            }
        }
        
        //Hard Mode
        let centerSquare = 4
        if !isSquareOccupied(in: moves, forIndex: centerSquare){
            return centerSquare
        }
        
        
        
        
        var movePosition = Int.random(in: 0..<9)
        
        while isSquareOccupied(in: moves, forIndex: movePosition){
            movePosition = Int.random(in: 0..<9)
        }
        
        return movePosition
    }
    
    func checkWinCondition(for player: Player,in moves: [Move?]) -> Bool {
        let winPatterns: Set<Set<Int>> = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
        
        let playerMoves = moves.compactMap{$0}.filter{ $0.player == player} // Removing nil from array and keep the player's move array's index
        
        let playerPosition = Set(playerMoves.map{$0.boardIndex}) // Give me the board indexed from player's array
        
        for pattern in winPatterns where pattern.isSubset(of: playerPosition){ return true }
        //check if a win condition existing from winPatterns and matches with playerPosition
        
        return false
    }
    
    func checkForDraw(in moves: [Move?]) -> Bool {
        return moves.compactMap{$0}.count == 9
    }
    
    func resetGame(){
        moves = Array(repeating: nil, count: 9)
    
    }
}
