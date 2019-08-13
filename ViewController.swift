//
//  ViewController.swift
//  HTTPSessions
//
//  Created by ted diepenbrock on 8/13/19.
//  Copyright © 2019 ted diepenbrock. All rights reserved.
//

import UIKit

struct UserData: Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
    var address: Address
    
    struct Address: Decodable {
        let street: String
        let suite: String
        let city: String
        let zipcode: String
        let geo: [String : String]
    }
    
    let phone: String
    let website: String
    let company: [String : String]
}





class ViewController: UIViewController {
    
    let jsonURL = "https://jsonplaceholder.typicode.com/users/1"
    
    
    // gets called when the view is loaded into memory
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // unwrap url
        guard let url = URL(string: jsonURL) else { return }
        
        // create url session with the url
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            // print(response!)
            
            // serialize data into json
            do {
                
                // swift 4
                let userData = try JSONDecoder().decode(UserData.self, from: data)
                print("\(userData.id) : \(userData.username)")
                print("\(userData.company)")
                print("\(userData.address)")
                print("\(userData.address.geo)")
                
                
                
                // swift 2, 3 and obj c
                // let userData = try JSONSerialization.jsonObject(with: data, options: [])
                // print(userData)
                
            } catch {
                print(error)
            }
            
            }.resume()
    }
    
    
//    @IBAction func onGetPressed(_ sender: Any) {
//
//    }

}

