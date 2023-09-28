//
//  AOIndicatorView.swift
//  TicTacToe
//
//  Created by Nick Theodoridis on 28/9/23.
//

import SwiftUI

struct AOIndicatorView: View {
    //Animation Stater
    @State private var indicatorScaleAmount: CGFloat = 0
    
    var body: some View{
        ZStack {
            Image(systemName: "circle" )
                .font(.system(size: 40,weight: .bold))
                .foregroundColor(.red)
                .scaleEffect(indicatorScaleAmount)
                .background{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.red.opacity(0.15))
                        .frame(width: 80,height: 80)
                }
        }
        .onAppear{
            withAnimation(.spring(response: 0.2)){
                indicatorScaleAmount = 1
            }
        }
    }
}

#Preview {
    AOIndicatorView()
}
