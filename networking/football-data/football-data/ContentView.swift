//
//  ContentView.swift
//  football-data
//
//  Created by Graceson Thompson on 9/14/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var teamList = [Team]()
    var body: some View {
        VStack {
            List(teamList) { team in
                Text(team.name ?? "No Name Found")
            }
            Button(action: {
                getTeams()
            }, label: {
                Text("Get Teams")
            })
        }
    }
    func getTeams() {
        Task {
            teamList = await DataService().teamsSearch()
        }
    }
}




#Preview {
    ContentView()
}
