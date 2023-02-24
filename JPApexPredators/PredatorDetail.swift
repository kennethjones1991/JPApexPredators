//
//  PredatorDetail.swift
//  JPApexPredators
//
//  Created by Kenneth Jones on 1/26/23.
//

import SwiftUI

struct PredatorDetail: View {
    let predator: ApexPredator
    
    var body: some View {
        ScrollView {
            VStack(alignment: .trailing) {
                ZStack(alignment: .bottomTrailing) {
                    Image(predator.type)
                        .resizable()
                        .scaledToFit()
                    
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/4)
                        .shadow(color: .black, radius: 6, x: 0, y: 0)
                        .offset(y: 15)
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                }
                
                VStack(alignment: .leading) {
                    Text(predator.name)
                        .font(.largeTitle)
                        .padding(.bottom, 8)
                    
                    Text("Appears In:")
                        .font(.title3)
                    
                    ForEach(predator.movies, id: \.self) { movie in
                        Text("•" + movie)
                            .font(.subheadline)
                    }
                    
                    Text("Movie Moments")
                        .font(.title)
                        .padding(.top, 15)
                    
                    ForEach(predator.movieScenes) { scene in
                        Text(scene.movie)
                            .font(.title2)
                            .padding([.top, .bottom], 1)
                        
                        Text(scene.sceneDescription)
                            .padding(.bottom, 15)
                    }
                    
                    Text("Read More:")
                        .font(.caption)
                    
                    Link(predator.link, destination: URL(string: predator.link)!)
                        .font(.caption)
                        .foregroundColor(.blue)
                }
                .padding()
            }
        }
        .ignoresSafeArea()
    }
}

struct PredatorDetail_Previews: PreviewProvider {
    static var previews: some View {
        PredatorDetail(predator: PredatorController.previewController.apexPredators[2])
            .preferredColorScheme(.dark)
    }
}
