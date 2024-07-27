//
//  NetworkManager.swift
//  A3
//
//  Created by Vin Bui on 7/9/23.
//

import Alamofire
import Foundation

class NetworkManager {
    
    /// Shared singleton instance
    static let shared = NetworkManager()
    
    private init() { }
        
    /// Endpoint for dev server
    private let devEndpoint: String = "https://chatdev-wuzwgwv35a-ue.a.run.app"
//    "\(devEndpoint)/api/posts/"
    ///Decoder
    let decoder = JSONDecoder()
    
    // MARK: - Requests
    
    //Fetch all post
    func fetchPosts(completion:@escaping([Post]) -> Void){
        decoder.dateDecodingStrategy = .iso8601
        //Create Request
        AF.request("\(devEndpoint)/api/posts/", method: .get)
            .validate()
            .responseDecodable(of:[Post].self,decoder: decoder){response in
                switch response.result{
                case .success(let posts):
                    completion(posts)
                case .failure(let error):
                    print("Error in NetworkManager.fetchPosts: \(error.localizedDescription)")
                    completion([])
                }
                
            }
    }
    
    // Create post
    func addPost(message:String, completion: @escaping (Post)-> Void){
        let parameters: Parameters = [
            "message" : message
        ]
        
        // Might need to change string.self to post.self
        AF.request("\(devEndpoint)/api/posts/create/", method: .post, parameters: parameters)
            .validate()
            .responseDecodable(of: Post.self, decoder: decoder){ response in
                switch response.result{
                case .success(let post):
                    completion(post)
                case .failure(let error):
                    print("Error in NetworkManager.addToRoster: \(error.localizedDescription)")
                }
            }
    }

    // Create post
    func likePost(postID:String, completion: @escaping (Bool)-> Void){
        let parameters: Parameters = [
            "post_id": postID,
            "net_id": "gct34"

        ]
        
        // Might need to change string.self to post.self
        AF.request("\(devEndpoint)/api/posts/like/", method: .post, parameters: parameters)
            .validate()
            .responseDecodable(of: Post.self, decoder: decoder){ response in
                switch response.result{
                case .success(_):
                    completion(true)
                case .failure(let error):
                    print("Error in NetworkManager.likePost: \(error.localizedDescription)")
                }
            }
    }
    // Create post
    func unlikePost(postID:String, completion: @escaping (Bool)-> Void){
        let parameters: Parameters = [
            "post_id": postID,
            "net_id": "gct34"

        ]
        
        // Might need to change string.self to post.self
        AF.request("\(devEndpoint)/api/posts/unlike/", method: .post, parameters: parameters)
            .validate()
            .responseDecodable(of: Post.self, decoder: decoder){ response in
                switch response.result{
                case .success(_):
                    completion(true)
                case .failure(let error):
                    print("Error in NetworkManager.likePost: \(error.localizedDescription)")
                }
            }
    }
    
}
