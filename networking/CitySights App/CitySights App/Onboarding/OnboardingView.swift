//
//  OnboardingView.swift
//  CitySights App
//
//  Created by Graceson Thompson on 2/5/25.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(\.dismiss) var dismiss
    @State var selectedViewIndex = 0
    
    var body: some View {
        ZStack{
            if selectedViewIndex == 0 {
                Color(red: 111/255, green: 154/255, blue: 189/255)
            }
            else{
                Color(red: 139/255, green: 166/255, blue: 65/255)
            }
            
            
            TabView(selection: $selectedViewIndex) {
                OnboardingViewDetails(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255),
                                      headline: "Welcome to City Sights!",
                                      subHeadline: "City Sights helps you find the best of the city!",
                                      buttonAction: {withAnimation {
                    selectedViewIndex = 1
                }})
                .tag(0)
                
                OnboardingViewDetails(bgColor: Color(red: 139/255, green: 166/255, blue: 65/255),
                                      headline: "Discover your city!",
                                      subHeadline: "We will show you good places to eat",
                                      buttonAction:{dismiss()})
                .tag(1)
                
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            VStack{
                Spacer()
                HStack(spacing: 16) {
                    Spacer()
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 0 ? .white : .gray)
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 1 ? .white : .gray)
                    Spacer()
                }
                .padding(.bottom, 190)
                }
            }
        .ignoresSafeArea()
        
    }
}

#Preview {
    OnboardingView()
}
