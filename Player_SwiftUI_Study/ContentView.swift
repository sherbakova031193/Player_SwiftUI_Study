//
//  ContentView.swift
//  Player_SwiftUI_Study
//
//  Created by Елизавета Щербакова on 21.02.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var progress: Double = 0
   @ObservedObject var viewModel = PlayerViewModel()
    
    var body: some View {
        VStack {
            Slider(value: Binding(get: {
                self.progress
            }, set: { newValue in
                print("new value:", newValue)
                self.progress = newValue
                self.viewModel.setTime(value: newValue)
            }), in: 0...viewModel.maxDuration).padding()
            HStack {
                Button(action: {
                    self.viewModel.play()
                }, label: {
                    Text("Play")
                })
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.orange)
                .cornerRadius(13)
                .foregroundColor(.white)
                
                Button(action: {
                    self.viewModel.stop()
                }, label: {
                    Text("Stop")
                })
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.orange)
                .cornerRadius(13)
                .foregroundColor(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
