//
//  ContentView.swift
//  BirdWatch
//
//  Created by Vin Bui on 11/13/23.
//


//CONTENTVIEW IS ENTRY POINT TO APP
import SwiftUI

struct ContentView: View {

    //Property wrapper used when you have a property
    //Auto updates no matter who uses it
    @State private var count : Int = 0
    @State private var location:String = ""
    @State private var name : String = ""
    
    //@StateObject -> to objects when they are classes but have to add @Published to the properties
    
    var body: some View {
        VStack(spacing: 50) {
            NavigationStack{
                profileView
                HStack{
                    addCountButton
                    NavigationLink{
                        //What you want to present
                        BirdListView()
                    }label: {
                        //What takes you there
                        viewBirdsButton
                    }
                }
                addBirdButton
            }
        }
    }

    private var profileView: some View {
        VStack {
            Image("newbie")
                .resizable()
                .frame(width: 200, height: 200)
            //Can group elements to apply modifiers at once
            Group {
                //Have to add "$" because it creates a read adn write which creates a 2 way binding so everytime you type it the state of the property name changes
                TextField("Name: ", text: $name)
                TextField("Location: ",text: $location)
                Text("Count: \(count)")
            }
            .font(.title)
        }
    }

    private var viewBirdsButton: some View {
        Text("View Birds")
            .font(.title2)
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
    
    private var addCountButton: some View {
        Button{
            //Do Something
            count += 1
        }label: {
            Text("Add Count")
                .font(.title2)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                .background(.green)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }  
    private var addBirdButton: some View {
        Button{
            //Do Something
            let bird = Bird(name: name, location: location, image: "newbie", count: count)
            birds.append(bird)
            name = ""
            location = ""
            count = 0

            
        }label: {
            Text("Add Bird")
                .font(.title2)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                .background(.orange)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }

}

#Preview {
    ContentView()
}
