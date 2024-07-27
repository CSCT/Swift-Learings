//
//  NetworkManager.swift
//  lec7
//
//  Created by Graceson Thompson on 11/5/23.
//
import Alamofire
import Foundation

class NetworkManager{
    ///Shared singleton instance -> only want one request at a time
    static let shared = NetworkManager()
    
    private let endpoint = "https://ioscourse-g3jtiqqehq-ue.a.run.app"
    
    //Create decoder
    private let decoder = JSONDecoder()
    
    private init(){
        
    }
    
    //Callbacks -> @espcaping allow the function to persist after it is done
    func fetchRoster(completion:@escaping([Member])->Void){
        
        
        //Create Request
        AF.request(endpoint,method: .get)
            .validate()
            .responseDecodable(of:[Member].self,decoder: decoder){response in
                switch response.result{
                case .success(let members):
                    completion(members)
                case .failure (let error):
                    // Makes error message more usefule
                    print("Error in NetworkManager.fetchRoster: \(error.localizedDescription)")
                    completion([])
                }
            }
    }
    
    //Still getting response of member even thought we are posting
    func addToRoster(member:Member,completion:@escaping (Member)->Void){
        let parameters: Parameters = [
            "name" : member.name,
            "subteam" : member.subteam,
            "position" : member.position
        ]
        
        //Need params when posting
        AF.request(endpoint,method: .post,parameters:parameters)
            .validate()
            .responseDecodable(of:Member.self,decoder:decoder){response in
                switch response.result{
                case .success(let member):
                    //Dependent on style
                    print("Sucessfully added \(member.name) to roster")
                    completion(member)
                case .failure(let error):
                    print("Error in NetworkManager.addToRoster: \(error.localizedDescription)")
                }
            }
    }
}
