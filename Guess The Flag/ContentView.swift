//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Gennady Raster on 1.11.22.
//

import SwiftUI

struct ContentView: View {

    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    var correctAnswer = Int.random(in: 0...2)

    
    var body: some View {
        ZStack{
            Color.blue
                .ignoresSafeArea()
            
            VStack(spacing: 30){
                VStack{
                    Text("Tap the flag of")
                    Text(countries[correctAnswer])
                }
                .foregroundColor(.white)
                
                ForEach(0..<3){ number in
                    Button{
                        
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                    }
                    
                }
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        ContentView()
//            .preferredColorScheme(.dark)
    }
}
