//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Gennady Raster on 1.11.22.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var showingStat = false
    
    @State private var scoreTitle = ""

    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)

    @State private var score = 0
    
    @State private var gameStat = (correct: 0, wrong: 0)
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                Gradient.Stop(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                Gradient.Stop(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Text("Guess The Flag")
                    .foregroundColor(.white)
                    .font(.largeTitle.bold())
                Spacer()
                VStack(spacing: 15){
                    VStack{
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundColor(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                            .foregroundColor(.black)
                    }
                    
                    
                    ForEach(0..<3){ number in
                        Button{
                            //flag was tapped
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                        
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title3.weight(.semibold))
                    .alert("Game Statistic", isPresented: $showingStat){
                        Button("OK"){
                            score = 0
                            gameStat.correct = 0
                            gameStat.wrong = 0
                        }
                    } message: {
                        Text("Correct: \(gameStat.correct)\nWrong: \(gameStat.wrong)")
                        
                    }
                Spacer()
            }
            
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        
    }
    
    func flagTapped(_ number: Int){
        
        
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            gameStat.correct += 1
        } else {
            scoreTitle = "Wrong"
            if score != 0 {
                score -= 1
            }
            gameStat.wrong += 1
        }
        if score == 5 {
            showingStat = true
        }
        if score != 5 {
            showingScore = true
        }
        
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        ContentView()
//            .preferredColorScheme(.dark)
    }
}
