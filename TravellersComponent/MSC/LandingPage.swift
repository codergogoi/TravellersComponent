//
//  LandingPage.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/18/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class LandingPage: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func onTapMakePayment(_  sender: UIButton){
        
        let myBookingVC = RoundTripViewController()
        self.navigationController?.pushViewController(myBookingVC, animated: true)
        
//
//        let paymentViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "payment") as! PaymentViewController
//        self.navigationController?.pushViewController(paymentViewController, animated: true)
//
//        let pvc = IntroViewController()
//        self.navigationController?.pushViewController(pvc, animated: true)

//        WebServiceAPI().fetchGeneticData(endPoint: "banks") { (banks: Banks?) in
//                   print("=======================================")
//                   print("banks : \(banks)")
//                    print("=======================================")
//
//        }
           
        
      
        
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
//        WebServiceAPI().fetchGeneticData(endPoint: "gateways") { (gateways: GatewaysData?) in
//
//                  print("=======================================")
//
//                              print("gateways : \(gateways)")
//                              print("=======================================")
//
//                     }
    }
    
 

    
    
    
    
}



struct GatewaysData: Decodable{
    var data: [String]
}

struct Bank: Decodable{
    
    var bank_name: String
    var bank_code: String
    var gateway: String
    var status: String
}


struct Banks: Decodable{
    var data: [Bank]
}
 

class WebServiceAPI{
    
    func fetchGeneticData<T: Decodable>(endPoint: String, completion: @escaping(T?) -> ()){
        
        let urlString = "https://akbarmobility.akbartravels.com/services/api/\(endPoint)"
        
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            do{
                let responseData = try JSONDecoder().decode(T.self, from: data)
                completion(responseData)
                
            }catch let jsonError{
                print("Failed to decod JSON", jsonError )
                completion(nil)
                return
            }
            
        }.resume()
        
    }
    
    
    
    
}


