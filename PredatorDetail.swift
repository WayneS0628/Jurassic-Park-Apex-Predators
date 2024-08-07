//
//  PredatorDetail.swift
//  JPApexPredators17
//
//  Created by Wayne Simmons Jr on 8/5/24.
//

import SwiftUI

struct PredatorDetail: View {
    let predator: ApexPredator
    
    var body: some View {
        GeometryReader{ geo in
            ScrollView{
                ZStack(alignment: .bottomTrailing){
                    //background image
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                    //dino image
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/1.5, height: geo.size.height/3)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y: 20)
                }
                // Dino name
                
                // Current location
                
                // Appears In (List of movies)
                
                // Movie moments
                
                // Link to Webpage
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    PredatorDetail(predator: Predators().apexPredators[2])
}
