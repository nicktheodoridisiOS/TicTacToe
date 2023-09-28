//
//  TabNavigationView.swift
//  TicTacToe
//
//  Created by Nick Theodoridis on 28/9/23.
//

import SwiftUI

struct TabNavigationView: View {
    
    @AppStorage("aiTfName") private var firstNamePlayerTf = "You"
    @AppStorage("secondNamePlayerTf") private var secondNamePlayerTf = "Player"
    @AppStorage("roundSelectedOption") private var roundSelectedOption = 0
    @AppStorage("roundAgainstSelectedOption") private var roundAgainstSelectedOption = 0
    @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled = false
    
    
    
    var body: some View {
        TabView{
            DiscoverView(isDarkModeEnabled: $isDarkModeEnabled)
                .tabItem(){
                    Image("tttIcon")
                    Text("Discover")
                }
            AIView(firstNamePlayerTf: $firstNamePlayerTf , roundSelectedOption: $roundSelectedOption,isDarkModeEnabled: $isDarkModeEnabled)
                .tabItem(){
                    Image(systemName: "poweroutlet.type.f.fill")
                    Text("AI")
                }
            AgainstMode(firstNamePlayerTf: $firstNamePlayerTf, secondNamePlayerTf: $secondNamePlayerTf, roundSelectedOption: $roundAgainstSelectedOption,isDarkModeEnabled: $isDarkModeEnabled)
                .tabItem(){
                    Image(systemName: "person.2.fill")
                    Text("Against")
                }
            SettingsView(firtPlayerNameTf: $firstNamePlayerTf,secondPlayerNameTf: $secondNamePlayerTf , roundSelectedOption: $roundSelectedOption,roundAgainstSelectedOption: $roundAgainstSelectedOption)
                .tabItem(){
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        .tint(.accentColor)
        .environment(\.colorScheme, isDarkModeEnabled ? .dark : .light)
    }
}

#Preview {
    TabNavigationView()
}
