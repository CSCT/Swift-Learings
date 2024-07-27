//
//  BirdListView.swift
//  BirdWatch
//
//  Created by Graceson Thompson on 11/14/23.
//

import SwiftUI

struct BirdListView: View {
    var body: some View {
        List(birds,id: \.self){ bird in
            birdInfoRow(bird)
        }
    }
    
    private func birdInfoRow(_ bird:Bird) -> some View{
        HStack{
            Text(String(bird.count))
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.trailing,30)
            
            VStack(alignment: .leading) {
                Text(bird.name)
                    .fontWeight(.bold)
                
                Text(bird.location)
                    .fontWeight(.medium)
                    .italic()
            }
            
            Spacer()
            
            Image(bird.image)
                .resizable()
                .frame(width: 100,height: 100)
        }
    }
}

#Preview {
    BirdListView()
}
