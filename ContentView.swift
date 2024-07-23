//
//  ContentView.swift
//  JPApexPredators17
//
//  Created by Wayne Simmons Jr on 6/23/24.
//

import SwiftUI

struct ContentView: View {
    let predators = Predators()
    @State var searchText = ""
    @State var alphabetical = false
    
    var filteredDinos: [ApexPredator] {
        predators.sort(by: alphabetical)
        return predators.search(for: searchText)
    }
    
    var body: some View {
        NavigationStack{
            List(filteredDinos) { predator in
                NavigationLink{
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                } label: {
                    HStack{
                        //Dinosaur image
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .shadow(color: .white, radius: 1.0)
                        
                        
                        VStack (alignment: .leading){
                            // Name
                            Text(predator.name)
                                .fontWeight(.bold)
                            // Type
                            Text(predator.type.rawValue.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 13)
                                .padding(.vertical, 5)
                                .background(predator.type.background)
                                .clipShape(.capsule)
                            
                        }
                    }
                }
            }
            .navigationTitle("Apex Predators")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    Button {
                        withAnimation(){
                            alphabetical.toggle()
                        }
                    } label: {
//                        if alphabetical{
//                            Image(systemName: "film")
//                                .foregroundColor(.white)
//                        }else{
//                            Image(systemName: "textformat")
//                                .foregroundColor(.white)
//                        }
                        Image(systemName: alphabetical ?
                              "film" : "textformat")
                        .foregroundStyle(.white)
                        .symbolEffect(.bounce, value: alphabetical)
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
