//
//  ContentView.swift
//  Guess The Place
//
//  Created by Ayan khan on 10/10/25.
//

import SwiftUI

struct FlagImage: ViewModifier {
    var place: String
    
    func body(content: Content) -> some View {
        Image(place)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    var places: [String] = ["France", "Italy", "Spain"].shuffled()
    @State private var showingAlert = false
    @State private var tappedAnswer = "Wrong"
    var correctAnswer = Int.random(in: 0..<3)
    
    var body: some View {
        ZStack(){
            RadialGradient(stops: [
                .init(color: .blue, location: 0.3),
                .init(color: .red, location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                VStack{
                    Text("Guess the flag of")
                        .foregroundStyle(.white)
                    Text(places[correctAnswer])
                        .foregroundStyle(.white)
                }
                
                ForEach(0..<3) { number in
                    Button{
                        showingAlert = true
                        
                        if(number == correctAnswer)
                        {
                            tappedAnswer = "Correct Answer"
                        }
                        else {
                            tappedAnswer = "Wrong"
                        }
                        
                    } label: {
                        modifier(FlagImage(place: places[number]))
                    }
                    .alert(tappedAnswer, isPresented: $showingAlert)
                    {
                        Button("Ok"){}
                    }
                }
                
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}
