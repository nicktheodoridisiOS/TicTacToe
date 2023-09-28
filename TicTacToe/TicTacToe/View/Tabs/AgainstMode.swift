//
//  AgainstMode.swift
//  TicTacToe
//
//  Created by Nick Theodoridis on 28/9/23.
//

import SwiftUI

struct AgainstMode: View {
    
    @Binding var firstNamePlayerTf: String
    @Binding var secondNamePlayerTf: String
    @Binding var roundSelectedOption: Int
    @Binding var isDarkModeEnabled: Bool
    
    
    var body: some View {
        NavigationStack{
            GeometryReader{ geometry in
                ScrollView{
                    VStack{
                        ZStack{
                            Rectangle()
                                .overlay{
                                    LinearGradient(gradient: Gradient(stops: [
                                        .init(color: .red, location: 0.10),
                                        .init(color: isDarkModeEnabled ? .black : .white, location: 1)
                                    ]), startPoint: .top, endPoint: .bottom)
                                }
                                .frame(height: 400)
                            
                            VStack(spacing: 10){
                                Image(systemName: "person.2.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 70))
                                
                                Text("Against Mode")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                Text("For changes to your preferences regarding the mode, you can go to the application settings.")
                                    .foregroundColor(.secondary)
                                    .font(.callout)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                            
                        }
                        VStack(spacing: 50){
                            VStack(alignment: .leading, spacing: 5){
                                
                                Text("ABOUT AGAINST MODE")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.red)
                                Text("Get ready for the continuous suspense and thrill of the waiting as you enter the world of Tic-Tac-Toe.Have fun and good luck in conquering Tic-Tac-Toe before your friend!")
                                    .font(.system(size: 17))
                                
                                
                                
                            }
                            .frame(maxWidth: .infinity,alignment:.topLeading)
                            .padding(.horizontal)
                            
                            NavigationLink(destination: AgainstGameplayView(
                                firstNamePlayerTf: $firstNamePlayerTf,
                                secondNamePlayerTf: $secondNamePlayerTf,
                                roundSelectedOption: $roundSelectedOption), label: {
                                    HStack{
                                        Image(systemName: "person.2.fill")
                                        Text("Play Against")
                                        
                                        
                                    }
                                    
                                    
                                })
                            .buttonStyle(.bordered)
                            .tint(.red)
                            
                        }.offset(y: -geometry.size.height / 30)
                    }
                    
                }.ignoresSafeArea()
            }
        }
    }
}

#Preview {
    AgainstMode(firstNamePlayerTf: .constant(""), secondNamePlayerTf: .constant(""), roundSelectedOption: .constant(0),isDarkModeEnabled: .constant(false))
}
