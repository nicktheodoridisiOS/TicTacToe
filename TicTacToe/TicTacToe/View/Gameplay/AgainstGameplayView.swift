//
//  AgainstGameplayView.swift
//  TicTacToe
//
//  Created by Nick Theodoridis on 28/9/23.
//

import SwiftUI

struct AgainstGameplayView: View {
    
    @StateObject private var againstViewModel = AgainstViewModel()
    
    @Binding var firstNamePlayerTf: String
    @Binding var secondNamePlayerTf: String
    
    @Binding var roundSelectedOption: Int
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Spacer()
                HStack(spacing:0){
                    VStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(againstViewModel.firstPlayerTurn ? .accentColor.opacity(0.15) : .gray.opacity(0.1))
                            .frame(width: 70,height:100)
                            .overlay{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(againstViewModel.firstPlayerTurn ? Color.accentColor : .gray.opacity(0.1))
                                    .frame(width: 70,height: 100)
                                    .overlay{
                                        VStack(spacing: 10){
                                            Image(systemName: "person.fill")
                                                .font(.largeTitle)
                                                .foregroundColor(againstViewModel.firstPlayerTurn ? .accentColor : .gray.opacity(0.1))
                                            Text(firstNamePlayerTf)
                                                .truncationMode(.tail)
                                                .fontWeight(.semibold)
                                                .foregroundColor(againstViewModel.firstPlayerTurn ? .accentColor : .gray.opacity(0.1))
                                                .padding(.horizontal)
                                        }
                                    }
                            }
                    }
                    VStack(spacing: 15){
                        Text("\(againstViewModel.firstPlayerScore) : \(againstViewModel.secondPlayerScore)")
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                        Text(againstViewModel.currentRound == roundSelectedOption ? "Last Round":"Round \(againstViewModel.currentRound + 1)")
                            .foregroundColor(againstViewModel.currentRound == roundSelectedOption ? .red.opacity(0.5) : .secondary.opacity(0.5))
                            .font(.system(size: againstViewModel.currentRound == roundSelectedOption ? 8 : 11))
                            .background{
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundColor(againstViewModel.currentRound == roundSelectedOption ? .red.opacity(0.2) : .secondary.opacity(0.2))
                                    .frame(width: 55,height:20)
                                    .overlay{
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(againstViewModel.currentRound == roundSelectedOption ? .red.opacity(0.5) : .secondary.opacity(0.5))
                                            .frame(width: 55,height:20)
                                    }
                            }
                        
                    }
                    .padding(.horizontal,25)
                    VStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(againstViewModel.secondPlayerTurn ? .red.opacity(0.15) : .gray.opacity(0.1))
                            .frame(width: 70,height:100)
                            .overlay{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(againstViewModel.secondPlayerTurn ? .red: .gray.opacity(0.1))
                                    .frame(width: 70,height: 100)
                                    .overlay{
                                        VStack(spacing: 10){
                                            Image(systemName: "person.fill")
                                                .font(.largeTitle)
                                                .foregroundColor(againstViewModel.secondPlayerTurn ? .red : .gray.opacity(0.1))
                                            Text(secondNamePlayerTf)
                                                .fontWeight(.semibold)
                                                .foregroundColor(againstViewModel.secondPlayerTurn ? .red : .gray.opacity(0.1))
                                        }
                                    }
                            }
                    }
                }
                Spacer()
                LazyVGrid(columns: againstViewModel.columns,spacing: 10 ){
                    ForEach(0..<9){ i in
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(Color.gray.opacity(0.1))
                                .frame(width: geometry.size.width/3 - 50, height: geometry.size.width/3 - 50)
                            
                            againstViewModel.amoves[i]?.indicator
                        }
                        .onTapGesture {
                            againstViewModel.gameProcess(for: i, roundSelectedOption: roundSelectedOption)
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .padding(.horizontal,50)
            .alert(item: $againstViewModel.alertItem, content: { alertItem in
                Alert(title: alertItem.title ,
                      message: alertItem.message ,
                      dismissButton: .default(alertItem.buttonTitle,action: {againstViewModel.resetGame()}))
            })
        }
        
    }
}

#Preview {
    AgainstGameplayView(firstNamePlayerTf: .constant(""), secondNamePlayerTf: .constant(""), roundSelectedOption: .constant(0))
}
