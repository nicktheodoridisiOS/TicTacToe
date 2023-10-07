//
//  DiscoverView.swift
//  TicTacToe
//
//  Created by Nick Theodoridis on 28/9/23.
//

import SwiftUI

struct DiscoverView: View {
    
    
    @Binding var isDarkModeEnabled: Bool
    
    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                ScrollView(showsIndicators: false){
                    VStack{
                        ZStack{
                            Rectangle()
                                .overlay{
                                    LinearGradient(gradient: Gradient(stops: [
                                        .init(color: .blue, location: 0.10),
                                        .init(color: isDarkModeEnabled ? .black : .white, location: 1)
                                    ]), startPoint: .top, endPoint: .bottom)
                                }
                                .frame(height: 400)
                            
                            VStack(spacing: 10){
                                VStack(spacing: 20){
                                    Image("tttIconL")
                                    
                                    Text("TicTacToe")
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .fontWeight(.bold)
                                }
                                
                                Text("For changes to your preferences regarding the mode, you can go to the application settings.")
                                    .foregroundColor(.secondary)
                                    .font(.callout)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                            
                        }
                        VStack(spacing: 50){
                            VStack(alignment: .leading, spacing: 5){
                                Text("WHAT IS TIC TAC TOE")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.accentColor)
                                Text("Tic-Tac-Toe, also known as noughts and crosses, is a strategy game typically played by two players taking turns to place their symbols (usually 'X' or 'O') on a 3x3 grid.")
                                    .font(.system(size: 17))
                            }
                            .frame(maxWidth: .infinity,alignment:.topLeading)
                            .padding(.horizontal)
                            VStack(alignment: .leading, spacing: 5){
                                Text("RULES")
                                    .foregroundColor(.accentColor)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                HStack(alignment:.top){
                                    Text("•")
                                    VStack(alignment: .leading, spacing: 0){
                                        Text("The first player usually uses 'X' while the second player uses 'O'")
                                    }
                                }
                                HStack(alignment:.top){
                                    Text("•")
                                    VStack(alignment: .leading, spacing: 0){
                                        Text("Players take alternating turns to place their symbol on the grid, starting with the first player.")
                                    }
                                }
                                HStack(alignment:.top){
                                    Text("•")
                                    VStack(alignment: .leading, spacing: 0){
                                        Text("The goal is to create a sequence of three identical symbols (either 'X' or 'O') horizontally, vertically, or diagonally.")
                                    }
                                }
                                HStack(alignment:.top){
                                    Text("•")
                                    VStack(alignment: .leading, spacing: 0){
                                        Text("If the grid fills up without a winner, the game is considered a draw.")
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity,alignment:.topLeading)
                            .padding(.horizontal)
                            VStack(alignment:.leading , spacing: 15){
                                Text("APPLICATION CONTENT")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.accentColor)
                                HStack(alignment:.center,spacing: 9){
                                    VStack(spacing: 10){
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 20)
                                                .foregroundColor(.yellow.opacity(0.15))
                                                .frame(height: 80)
                                            Image(systemName: "poweroutlet.type.f.fill")
                                                .font(.system(size: 35))
                                                .foregroundColor(.yellow)
                                        }
                                        Text("AI Mode")
                                            .font(.system(size: 12,weight: .semibold))
                                    }
                                    VStack(spacing: 10){
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 20)
                                                .foregroundColor(.red.opacity(0.15))
                                                .frame(height: 80)
                                            Image(systemName: "person.2.fill")
                                                .font(.system(size: 35))
                                                .foregroundColor(.red)
                                        }
                                        Text("Against Mode")
                                            .font(.system(size: 12,weight: .semibold))
                                    }
                                    VStack(spacing: 10){
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 20)
                                                .foregroundColor(.purple.opacity(0.15))
                                                .frame(height: 80)
                                            Image(systemName: "paintbrush.fill")
                                                .font(.system(size: 35))
                                                .foregroundColor(.purple)
                                        }
                                        Text("Customize")
                                            .font(.system(size: 12,weight: .
                                                         semibold))
                                    }
                                }
                                Spacer(minLength: 30)
                                
                            }
                            .frame(maxWidth: .infinity,alignment:.topLeading)
                            .padding(.horizontal)
                        }.offset(y: -geometry.size.height / 30)
                        
                    }
                }.ignoresSafeArea()
                    .padding(.bottom)
            }
        }
    }
}

#Preview {
    DiscoverView(isDarkModeEnabled: .constant(false))
}
