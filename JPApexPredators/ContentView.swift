//
//  ContentView.swift
//  JPApexPredators
//
//  Created by Kenneth Jones on 1/26/23.
//

import SwiftUI

struct ContentView: View {
    let apController = PredatorController()
    @State var sortAlphabetical = false
    @State var currentFilter = PredatorType.all
    
    var body: some View {
        apController.filterBy(type: currentFilter)
        
        if sortAlphabetical {
            apController.sortByAlphabetical()
        } else {
            apController.sortByMovieAppearance()
        }
        // Show the ternary operator here, and then talk about why we don't always use it since it just takes way too long to figure out what's happening. With the if else, we can easily see what's going on.
        
        return NavigationStack {
            List {
                ForEach(apController.apexPredators) { predator in
                    NavigationLink(destination: PredatorDetail(predator: predator)) {
                        PredatorRow(predator: predator)
                    }
                }
            }
            .navigationTitle("Apex Predators")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        withAnimation {
                            sortAlphabetical.toggle()
                        }
                    } label: {
//                        if sortAlphabetical {
//                            Image(systemName: "film")
//                        } else {
//                            Image(systemName: "textformat")
//                        } // Keep for example, then use ternary to show shorter version
                        Image(systemName: sortAlphabetical ? "film" : "textformat")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $currentFilter.animation()) {
                            ForEach(PredatorType.allCases, id: \.self) { type in
                                HStack {
                                    Text(type.rawValue.capitalized)
                                    
                                    Spacer()
                                    
                                    Image(systemName: type.icon)
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
