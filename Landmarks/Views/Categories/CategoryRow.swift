//
//  CategoryRow.swift
//  Landmarks
//
//  Created by raghu on 29/8/21.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack{
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 16)
                .padding(.top, 6)
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack(alignment: .top,spacing: 0){
                    ForEach(items){landmark in
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)){
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }.frame(height: 185)
            
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[0].category.rawValue, items: Array(landmarks.prefix(4))
        )
    }
}
