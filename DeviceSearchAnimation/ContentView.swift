//
//  ContentView.swift
//  DeviceSearchAnimation
//
//  Created by Ale on 19/05/2023.
//

import SwiftUI

struct DeviceSearchAnimation: View {
    
    @State private var scaleSize: CGFloat = .zero
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color(.purple).gradient)
                .ignoresSafeArea()
            
            Text("Searching for devices near you...")
                .font(.title3).bold()
                .foregroundColor(.white)
                .padding(.top, -350)
            
            ForEach(1..<1000) { index in
                makeCircle(value: CGFloat(Double(index) + 0.50))
            }
            
            Circle()
                .fill(.white)
                .frame(width: 150, height: 150)
                .overlay {
                    Image(systemName: "iphone.gen2")
                        .foregroundColor(Color.purple.opacity(0.6))
                        .font(.system(size: 70))
                        
                }
            
            
        }.onReceive(timer) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                scaleSize = 3
            })
        }
    }
    
    @ViewBuilder
    func makeCircle(value: CGFloat) -> some View {
        Circle()
            .fill(.white.opacity(scaleSize == 3 ? 0.0 : 1.3))
            .frame(width: 150, height: 150)
            .scaleEffect(scaleSize)
            .animation(.easeInOut(duration: 5.4).delay(value), value: scaleSize)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceSearchAnimation()
    }
}
