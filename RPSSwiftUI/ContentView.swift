//
//  ContentView.swift
//  RPSSwiftUI
//
//  Created by Tihomir RAdeff on 4.06.21.
//

import SwiftUI

struct ContentView: View {
    
    @State var cpuPoints = 0
    @State var playerPoints = 0
    @State var totalNumberOfGame = 0
    
    @State var cpuImage = "rock"
    @State var playerImage = "rock"
    
    var body: some View {
        VStack{
            Spacer()
            //vertical layout
            VStack {
                
                //cpu points
                Text("Points: \(cpuPoints)")
                    .font(.system(size: 24))
                    .bold()
                
                //cpu image
                Image(cpuImage)
                
                //player image
                Image(playerImage)
                    .onTapGesture {
                        //cpu hand
                        let cpuTap = Int.random(in: 1...3)
                        cpuImage = imageGenerator(cpuTap)
                        
                        //my hand
                        let myTap = Int.random(in: 1...3)
                        playerImage = imageGenerator(myTap)
                        
                        calculatePoints(myTap, cpuTap)
        
                        totalNumberOfGame += 1
                        
                        if totalNumberOfGame >= 10{
                            cpuPoints = 0
                            playerPoints = 0
                            totalNumberOfGame = 0
                        }
                    }
                
                //player points
                Text("Points: \(playerPoints)")
                    .font(.system(size: 24))
                    .bold()
            }
            Spacer()
            //cpu points
            Text("Total number of games: \(totalNumberOfGame)")
                .font(.system(size: 28))
                .bold()
            
        }
        
    }
    
    func imageGenerator(_ num: Int) -> String {
        if num == 1 {
            return "rock"
        } else if num == 2 {
            return "paper"
        } else if num == 3 {
            return "scissors"
        }
        return "rock"
    }
    
    func calculatePoints(_ my: Int, _ cpu: Int) {
        //1 = rock, 2 = paper, 3 = scissors
        if my == 1 && cpu == 2 {
            cpuPoints += 1
        }
        if my == 1 && cpu == 3 {
            playerPoints += 1
        }
        
        if my == 2 && cpu == 1 {
            playerPoints += 1
        }
        if my == 2 && cpu == 3 {
            cpuPoints += 1
        }
        
        if my == 3 && cpu == 1 {
            cpuPoints += 1
        }
        if my == 3 && cpu == 2 {
            playerPoints += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
