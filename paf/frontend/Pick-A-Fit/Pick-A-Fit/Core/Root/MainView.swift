//
//  MainView.swift
//  Pick-A-Fit
//
//  Created by Graceson Thompson on 1/21/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        Group{
            if viewModel.userSession != nil{
                ProfileView()
            }else{
                LoginView()
            }
        }
//        TabView{
//            
//            //MARK: -Views
//            HomeView()
//                .tabItem {
//                    VStack{
//                        Image(systemName: "house.circle")
//                        Text("Home")
//                    }
//                }
//            
//            CameraView()
//                .tabItem {
//                    VStack{
//                        Image(systemName: "plus.circle")
//                    }
//                }
//            
//            ProfileView()
//                .tabItem {
//                    VStack{
//                        Image(systemName: "person.circle")
//                        Text("Profile")
//                    }
//                }
//        }
    }
}

#Preview {
    MainView()
}
