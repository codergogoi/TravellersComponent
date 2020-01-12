//
//  WebServices.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/24/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import Foundation
import UIKit

struct AppConst{
    let baseURL = "https://akbarmobility.akbartravels.com/services/api/"
    let utilityURL = "www.akbartravels.com/utility/"
}

struct AppWebService{
    
    func getRequest<T: Decodable>(with  endPoint: String, completion: @escaping(_ response: T?) -> Void){
        
        let baseUrl = URL(string: "\(AppConst().baseURL)\(endPoint.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")")!
        
        let urlRequest = URLRequest(url: baseUrl)
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            guard let responseData = data, error == nil else {
                completion(nil)
                return
            }
            do{
                let completeResponse = try JSONDecoder().decode(T.self, from: responseData)
                completion(completeResponse)
            }catch let jsonError{
                print(jsonError.localizedDescription)
                completion(nil)
            }
        }
        task.resume()
    }
    
    
    func postRequest<T: Decodable>(with  endPoint: String, dictionary: [String: Any] ,completion: @escaping(_ response: T?) -> Void){
        
        let baseUrl = URL(string: "\(AppConst().baseURL)\(endPoint.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")")!
        
        let urlRequest = URLRequest(url: baseUrl)
        
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            guard let responseData = data, error == nil else {
                completion(nil)
                return
            }
            do{
                let completeResponse = try JSONDecoder().decode(T.self, from: responseData)
                completion(completeResponse)
            }catch let jsonError{
                print(jsonError.localizedDescription)
                completion(nil)
            }
        }
        task.resume()
    }
    
    /*
     WebService().fetchGeneticData(endPoint: "") { (completeResponse: CompleteResponse) in
        
        // completeResponse will be parsed struct data
        
    }

     struct CompleteResponse: Codable{
         
         let bookings:[Bookings]
         let code: Int
         
         private enum CodingKeys: String, CodingKey {
             
             let booking = "Booking"
             let code = "Code"
             
         }
         
     }

     */
    
}
