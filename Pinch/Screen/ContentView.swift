//
//  ContentView.swift
//  Pinch
//
//  Created by Kamil Kowalczyk on 05/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - PROPERTY
    
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    
    //MARK: - FUNCTION
    
    //MARK: - CONTENT
    
    var body: some View{
        NavigationView {
            ZStack {
            // MARK: - PAGE IMAGE
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1: 0)
                    .scaleEffect(imageScale)
                // MARK: - 1 TAP GESTURE
                
                    .onTapGesture(count: 2, perform: {
                        if imageScale == 1 {
                            withAnimation(.spring()) {
                                imageScale = 2
                            }
                        } else {
                            withAnimation(.spring()) {
                                imageScale = 1
                            }
                        }
                    })
                
            } //: ZSTACK
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                withAnimation(.linear(duration: 3)) {
                    isAnimating  = true
                }
            })
                    }  //: NAVIGATION
        .navigationViewStyle(.stack)
    }
    
}

#Preview {
    ContentView()
}
