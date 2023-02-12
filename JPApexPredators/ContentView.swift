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
    @State var currentFilter = "All"
    
    var body: some View {
        apController.filterBy(type: currentFilter)
        
        if sortAlphabetical {
            apController.sortByAlphabetical()
        } else {
            apController.sortByMovieAppearance()
        }
        
        return NavigationStack { // Change; to NavigationStack
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
                            ForEach(apController.typeFilters, id: \.self) { type in
                                HStack {
                                    Text(type)
                                    
                                    Spacer()
                                    
                                    Image(systemName: apController.typeIcon(for: type))
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
        .preferredColorScheme(.dark) // New
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .preferredColorScheme(.dark) // Remove; put on actual view instead
    }
}
