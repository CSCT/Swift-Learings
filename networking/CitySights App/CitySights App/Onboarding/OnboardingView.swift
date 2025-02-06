//
//  OnboardingView.swift
//  CitySights App
//
//  Created by Graceson Thompson on 2/5/25.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView{
            OnboardingViewDetails(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255),
                                  headline: "Welcome to City Sights!",
                                  subHeadline: "City Sights helps you find the best of the city!",
                                  buttonAction: {print("Screen 1")})
            
            OnboardingViewDetails(bgColor: Color(red: 139/255, green: 166/255, blue: 65/255),
                                  headline: "Discover your city!",
                                  subHeadline: "We will show you good places to eat",
                                  buttonAction: {print("Screen 2")})

        }
        .tabViewStyle(.page)
        .ignoresSafeArea()
        
    }
}

#Preview {
    OnboardingView()
}
