//
//  RegistrationView.swift
//  Pick-A-Fit
//
//  Created by Graceson Thompson on 2/4/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel

    
    var body: some View {
        VStack{
            //image
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200,height: 200)
                .padding(.vertical, 32)
            
            //form fields
            VStack(spacing: 24){
                InputView(text: $email,
                          title: "Email Address",
                          placeholder: "name@example/com")
                .textInputAutocapitalization(.never)
                InputView(text: $fullname,
                          title: "Full Name",
                          placeholder: "Enter your name")
                .textInputAutocapitalization(.never)
                
                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter your password",
                          isSecureField: true)
                .textInputAutocapitalization(.never)                
                
                InputView(text: $confirmPassword,
                          title: "Confirm Password",
                          placeholder: "Confirm your password",
                          isSecureField: true)
                .textInputAutocapitalization(.never)
            }
            .padding(.horizontal)
            .padding(.top,12)
            
            Button{
                Task{
                    try await viewModel.createUser(withEmail: email,
                                                   password: password,
                                                   fullname:fullname)
                }
            }label: {
                HStack{
                    Text("SIGN UP")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundStyle(.white)
                .frame(width: UIScreen.main.bounds.width - 32,height: 48)
            }
            .background(.blue)
            .cornerRadius(10)
            .padding(.top,24)
            
            Spacer()
            
            Button{
                dismiss()          
            }label: {
                HStack{
                    Text("Don't have an account?")
                    Text("Sign Up")
                        .fontWeight(.bold)
                }
                .font(.system(size: 16))
            }
        }
    }
}

#Preview {
    RegistrationView()
}
