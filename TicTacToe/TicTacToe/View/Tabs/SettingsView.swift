//
//  SettingsView.swift
//  TicTacToe
//
//  Created by Nick Theodoridis on 28/9/23.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var firtPlayerNameTf: String
    @Binding var secondPlayerNameTf: String
    @Binding var roundSelectedOption: Int
    @Binding var roundAgainstSelectedOption: Int
    
    @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled = false
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    Section(header: Text("PREFERENCES")){
                        HStack{
                            Image(systemName: "person")
                                .font(.title3)
                                .overlay{
                                    LinearGradient(
                                        gradient: Gradient(colors:[
                                            .cyan.opacity(1),
                                            .blue]),
                                        startPoint:
                                                .topTrailing,
                                        endPoint:
                                            .bottomLeading)
                                }
                                .mask{
                                    Image(systemName: "person")
                                        .font(.title3)
                                }
                            
                            TextField(firtPlayerNameTf,text: $firtPlayerNameTf)

                        }
                        
                        HStack{
                            Image(systemName: "person")
                                .font(.title3)
                                .overlay{
                                    LinearGradient(
                                        gradient: Gradient(colors:[
                                            .yellow.opacity(1),
                                            .red]),
                                        startPoint:
                                                .topTrailing,
                                        endPoint:
                                            .bottomLeading)
                                }
                                .mask{
                                    Image(systemName: "person")
                                        .font(.title3)
                                }
                            TextField(secondPlayerNameTf,text: $secondPlayerNameTf)
                        }
                    }
                    
                    Section(header: Text("AI MODE")){
                        HStack{
                            Image(systemName: "poweroutlet.type.f")
                                .font(.title3)
                                .overlay{
                                    LinearGradient(
                                        gradient: Gradient(colors:[
                                            .yellow.opacity(1),
                                            .orange]),
                                        startPoint:
                                                .topTrailing,
                                        endPoint:
                                            .bottomLeading)
                                }
                                .mask{
                                    Image(systemName: "poweroutlet.type.f")
                                        .font(.title3)
                                }
                            
                            Picker("Rounds", selection: $roundSelectedOption) {
                                ForEach(1..<11) { round in
                                    Text("\(round)")
                                }
                            }
                        }
                    }
                    
                    Section(header: Text("AGAINST MODE")){
                        HStack{
                            Image(systemName: "person.2")
                                .font(.title3)
                                .overlay{
                                    LinearGradient(
                                        gradient: Gradient(colors:[
                                            .yellow.opacity(1),
                                            .red]),
                                        startPoint:
                                                .topTrailing,
                                        endPoint:
                                            .bottomLeading)
                                }
                                .mask{
                                    Image(systemName: "person.2")
                                        .font(.title3)
                                }
                            
                            Picker("Rounds", selection: $roundAgainstSelectedOption) {
                                ForEach(1..<11) { round in
                                    Text("\(round)")
                                }
                            }
                        }
                    }
                    
                    Section(header: Text("DISPLAY"),footer: Text("Enabling dark mode is going to change the entire appearance of the application, beyond your device's general settings. ")){
                        HStack{
                            Image(systemName: "moon")
                                .font(.title3)
                                .overlay{
                                    LinearGradient(
                                        gradient: Gradient(colors:[
                                            .pink.opacity(1),
                                            .purple]),
                                        startPoint:
                                                .topTrailing,
                                        endPoint:
                                            .bottomLeading)
                                }
                                .mask{
                                    Image(systemName: "moon")
                                        .font(.title3)
                                }
                            Toggle("Dark Mode" , isOn: $isDarkModeEnabled)
                        }
                    }
                    
                    
                }
                .navigationTitle("Settings")
                .listStyle(.insetGrouped)
            }
        }
    }
}

#Preview {
    SettingsView(firtPlayerNameTf: .constant(""), secondPlayerNameTf: .constant(""), roundSelectedOption: .constant(0), roundAgainstSelectedOption: .constant(0))
}
