//
//  ContentView.swift
//  ToggleSwitch
//
//  Created by 이용석 on 2021/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isOn: Bool = false
    
    var body: some View {
        VStack{
            Toggle(
                self.isOn ? "true" : "false"
                , isOn: $isOn)
                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Toggle("", isOn: $isOn)
                .toggleStyle(CustomToggle())
                .frame(width: 100, height: 50, alignment: .center)
        }
    }
}

// Custom Toggle switch

struct CustomToggle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // Design
        RoundedRectangle(cornerRadius: 50)
            .foregroundColor(configuration.isOn ? .green : .gray)
            .opacity(configuration.isOn ? 1.0 : 0.3)
            .animation(.easeInOut(duration: 0.2))
            .overlay(
                
                GeometryReader(content: { geometry in
                    let ballSize = geometry.size.height - 2
                    
                    ZStack{
                        Circle()
                            .frame(width: ballSize)
                            .foregroundColor(.red)
                        Text(configuration.isOn ? "ON" : "OFF")
                            .foregroundColor(.white)
                            //.foregroundColor(configuration.isOn ? .green : .gray)
                            .animation(.easeInOut(duration: 0.2))
                    }
                    .offset(x: configuration.isOn ? (geometry.frame(in:.local).maxX - 2) - ballSize : geometry.frame(in: .local).minX + 2)
                    .animation(.easeInOut(duration: 0.2))
                    //.shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                })
            )
            //.clipShape(Capsule())
            .onTapGesture(count: 1, perform: {
                configuration.isOn.toggle()
            })
    }
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
