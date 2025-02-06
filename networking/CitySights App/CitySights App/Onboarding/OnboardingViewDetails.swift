//
//  OnboardingViewDetails.swift
//  CitySights App
//
//  Created by Graceson Thompson on 2/5/25.
//

import SwiftUI

struct OnboardingViewDetails: View {
    
    var bgColor: Color
    var headline: String
    var subHeadline: String
    var buttonAction: () -> Void
    
    
    
    var body: some View {
        ZStack{
            Color(bgColor)
            
            VStack{
                Spacer()
                Spacer()
                
                Image("onboarding")
                
                Text("Welcome to City Sights!")
                    .foregroundStyle(Color.white)
                    .font(Font.system(size: 22))
                    .fontWeight(.bold)
                    .padding(.top,32)
                
                Text("City Sights helps you find the best of the city!")
                    .foregroundStyle(Color.white)
                    .padding(.top,4)
                    .padding(.horizontal)
                    
                Spacer()
                
                Button {
                    buttonAction()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundStyle(Color.white)
                            .frame(height: 50)
                        Text("Continue")
                            .bold()
                            .foregroundStyle(Color.black)
                    }
                }
                .padding(.bottom,81)
                .padding(.horizontal)

            }
        }
        .ignoresSafeArea()    }
}

#Preview {
    OnboardingViewDetails(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255),
                          headline: "Welcome to City Sights!",
                          subHeadline: "City Sights helps you find the best of the city!",
                          buttonAction: {})
}
