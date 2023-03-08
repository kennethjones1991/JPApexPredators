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
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .trailing) {
                    ZStack(alignment: .bottomTrailing) {
                        Image(predator.type.rawValue)
                            .resizable()
                            .scaledToFit()
                            .overlay(
                                LinearGradient(gradient: Gradient(stops: [
                                    .init(color: .clear, location: 0.8),
                                    .init(color: .black, location: 1)
                                ]), startPoint: .top, endPoint: .bottom)
                            )
                        
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width/1.5, height: geo.size.height/3)
                            .shadow(color: .black, radius: 6, x: 0, y: 0)
                            .offset(y: 20)
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
}

struct PredatorDetail_Previews: PreviewProvider {
    static var previews: some View {
        PredatorDetail(predator: PredatorController.preview.apexPredators[2])
            .preferredColorScheme(.dark)
    }
}
