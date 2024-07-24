//
//  AuthViewModel.swift
//  Pick-A-Fit
//
//  Created by Graceson Thompson on 2/13/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

//Publish all UI changes on the main thread
@MainActor
class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init(){
        //Will keep the user logged in
        self.userSession = Auth.auth().currentUser
        
        Task{
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String)async throws{
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        }catch{
            print("DEBUG: Failed to sign in with error: \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password:String, fullname:String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            //encodes data to json to be stored in firebase
            let encodedUser = try Firestore.Encoder().encode(user)
            //What uploads information to firebase
            print("1")
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            print("2")
            // Make sure we can fetch the user
            await fetchUser()
        }catch{
            print("DEBUG: Failed to create user with error: \(error.localizedDescription)")
        }
    }
    
    func signOut(){
        do {
            try Auth.auth().signOut() // signs user out on backend
            self.userSession = nil // wipes out user session and takes us back to the login screen by autoupdating
            self.currentUser = nil // wipes out the current user data model
        }catch{
            print("DEBUG: Failed to sign out with error: \(error.localizedDescription)")
        }
    }
    
    func deleteAccount(){
        
    }
    
    func fetchUser() async{
        guard let uid = Auth.auth().currentUser?.uid else { return }
        //May wrap in do ... catch
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        self.currentUser = try? snapshot.data(as: User.self)
    }
}
