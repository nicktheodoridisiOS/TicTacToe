//
//  AIView.swift
//  TicTacToe
//
//  Created by Nick Theodoridis on 28/9/23.
//

import SwiftUI

struct AIView: View {
    
    @Binding var firstNamePlayerTf: String
    @Binding var roundSelectedOption: Int
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
                                        .init(color: .yellow, location: 0.10),
                                        .init(color: isDarkModeEnabled ? .black : .white, location: 1)
                                    ]), startPoint: .top, endPoint: .bottom)
                                }
                                .frame(height: 400)
                            
                            VStack(spacing: 10){
                                Image(systemName: "poweroutlet.type.f.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 70))
                                
                                Text("AI Mode")
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
                                Text("ABOUT AI MODE")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.yellow)
                                Text("Artificial Intelligence (AI) is a field of computer science that deals with the design and development of systems capable of performing tasks that require human intelligence. The AI of this application (Tic-Tac-Toe) has been programmed to face any human intelligence. Are you capable of facing it?")
                                    .font(.system(size: 17))
                            }
                            .frame(maxWidth: .infinity,alignment:.topLeading)
                            .padding(.horizontal)
                            
                            NavigationLink(destination: AIGameplayView(firstNamePlayerTf: $firstNamePlayerTf,roundSelectedOption: $roundSelectedOption), label: {
                                HStack{
                                    Image(systemName: "poweroutlet.type.f.fill")
                                    Text("Play Against AI")
                                        
                                        
                                }
                               
                                
                            })
                            .buttonStyle(.bordered)
                            .tint(.yellow)
                        }.offset(y: -geometry.size.height / 30)
                        
                        
                    }
                    
                }
                .ignoresSafeArea()
            }
            
        }
        
    }
}

#Preview {
    AIView(firstNamePlayerTf: .constant(""),roundSelectedOption: .constant(0),isDarkModeEnabled: .constant(false))
}
