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
    
    var body: some View {
        if sortAlphabetical {
            apController.sortByAlphabetical()
        } else {
            apController.sortByMovieAppearance()
        }
        
        return NavigationView {
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
                        sortAlphabetical.toggle()
                    } label: {
                        if sortAlphabetical {
                            Image(systemName: "film")
                        } else {
                            Image(systemName: "textformat")
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
