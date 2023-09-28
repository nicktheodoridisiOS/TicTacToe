//
//  AIGameplayView.swift
//  TicTacToe
//
//  Created by Nick Theodoridis on 28/9/23.
//

import SwiftUI

struct AIGameplayView: View {
    
    @StateObject private var aiViewModel = AIViewModel()
    
    @Binding var firstNamePlayerTf: String
    @Binding var roundSelectedOption: Int
    
    //Animation Stater
    @State private var gridScaleAmount: CGFloat = 0
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Spacer()
                HStack(spacing:0){
                    VStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(aiViewModel.humanTurn ? .accentColor.opacity(0.15) : .gray.opacity(0.1))
                            .frame(width: 70,height:100)
                            .overlay{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(aiViewModel.humanTurn ? Color.accentColor : .gray.opacity(0.1))
                                    .frame(width: 70,height: 100)
                                    .overlay{
                                        VStack(spacing: 10){
                                            Image(systemName: "person.fill")
                                                .font(.largeTitle)
                                                .foregroundColor(aiViewModel.humanTurn ? .accentColor : .gray.opacity(0.1))
                                            Text(firstNamePlayerTf)
                                                .truncationMode(.tail)
                                                .fontWeight(.semibold)
                                                .foregroundColor(aiViewModel.humanTurn ? .accentColor : .gray.opacity(0.1))
                                                .padding(.horizontal)
                                        }
                                    }
                            }
                    }
                    VStack(spacing: 15){
                        Text("\(aiViewModel.humanScore) : \(aiViewModel.aiScore)")
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                        Text(aiViewModel.currentRound == roundSelectedOption ? "Last Round":"Round \(aiViewModel.currentRound + 1)")
                            .foregroundColor(aiViewModel.currentRound == roundSelectedOption ? .yellow.opacity(0.5) : .secondary.opacity(0.5))
                            .font(.system(size: aiViewModel.currentRound == roundSelectedOption ? 8 : 11))
                            .background{
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundColor(aiViewModel.currentRound == roundSelectedOption ? .yellow.opacity(0.2) : .secondary.opacity(0.2))
                                    .frame(width: 55,height:20)
                                    .overlay{
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(aiViewModel.currentRound == roundSelectedOption ? .yellow.opacity(0.5) : .secondary.opacity(0.5))
                                            .frame(width: 55,height:20)
                                    }
                            }
                        
                    }
                    .padding(.horizontal,25)
                    
                    VStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(aiViewModel.aiTurn ? .yellow.opacity(0.15) : .gray.opacity(0.1))
                            .frame(width: 70,height:100)
                            .overlay{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(aiViewModel.aiTurn ? .yellow: .gray.opacity(0.1))
                                    .frame(width: 70,height: 100)
                                    .overlay{
                                        VStack(spacing: 10){
                                            Image(systemName: "poweroutlet.type.f.fill")
                                                .font(.largeTitle)
                                                .foregroundColor(aiViewModel.aiTurn ? .yellow : .gray.opacity(0.1))
                                            Text("AI")
                                                .fontWeight(.semibold)
                                                .foregroundColor(aiViewModel.aiTurn ? .yellow : .gray.opacity(0.1))
                                        }
                                    }
                            }
                    }
                }
                Spacer()
                LazyVGrid(columns: aiViewModel.columns,spacing: 10 ){
                    ForEach(0..<9){ i in
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(aiViewModel.isSquareOccupied(in: aiViewModel.moves, forIndex: i) ? Color.gray.opacity(0) : Color.gray.opacity(0.1))
                                .frame(width: geometry.size.width/3 - 50, height: geometry.size.width/3 - 50)
                            
                            aiViewModel.moves[i]?.indicator
                            
                        }
                        .scaleEffect(gridScaleAmount)
                        .onTapGesture{
                            aiViewModel.processPlayerMove(for: i , roundSelectedOption: roundSelectedOption)
                            
                        }
                        .onAppear{
                            withAnimation(.spring()){
                                gridScaleAmount = 1
                            }
                            aiViewModel.aiTurn = false
                            aiViewModel.humanTurn = true
                        }
                    }
                }
                Spacer()
            }
            .disabled(aiViewModel.isGameBoardDisabled)
            .padding()
            .padding(.horizontal,50)
            .alert(item: $aiViewModel.alertItem, content: { alertItem in
                Alert(title: alertItem.title ,
                      message: alertItem.message ,
                      dismissButton: .default(alertItem.buttonTitle,action: {aiViewModel.resetGame()}))
            })
        }
    }
}

#Preview {
    AIGameplayView(firstNamePlayerTf: .constant(""),roundSelectedOption: .constant(0))
}
