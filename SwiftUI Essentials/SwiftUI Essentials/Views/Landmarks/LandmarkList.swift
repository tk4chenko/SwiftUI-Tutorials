//
//  LandmarkList.swift
//  SwiftUI Essentials
//
//  Created by Artem Tkachenko on 04.08.2023.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    var body: some View {
        NavigationView {
        
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                            .environmentObject(modelData)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("Landmarks")
        }
    }
}

struct LdmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
