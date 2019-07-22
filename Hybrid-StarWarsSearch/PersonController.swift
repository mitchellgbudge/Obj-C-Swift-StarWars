//
//  PersonController.swift
//  Hybrid-StarWarsSearch
//
//  Created by Mitchell Budge on 7/22/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import UIKit

private let baseURL = URL(string: "https://swapi.co/api/people")!

class PersonController: NSObject {
    
    static let shared = PersonController()
    
    func searchForPeople(with searchTerm: String, completion: @escaping ([MBPerson]?, Error?) -> Void) {
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        let searchItem = URLQueryItem(name: "search", value: searchTerm)
        components.queryItems = [searchItem]
        let url = components.url!
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil, NSError())
                return
            }
            do {
                guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any],
                    let personDictionaries = dictionary["results"] as? [[String : Any]]
                else {
                    throw NSError()
                }
                var people = [MBPerson]()
                for dictionary in personDictionaries {
                    if let person = MBPerson(dictionary: dictionary) {
                        people.append(person)
                    }
                }
            } catch {
                completion(nil, error)
                return
            }
            
        }.resume()
    }
}
