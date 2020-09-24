//
//  ModelLoader.swift
//  Twitter
//
//  Created by Mewtru on 9/23/20.
//

import Foundation

struct ModelLoader<Model: Codable> {
    
    let decoder = JSONDecoder()
    
    func load(at url: String, completion: @escaping (Model) -> Void) {
        let url = URL(string: url)!
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Didn't get any data")
                return
            }

            do {
                let model = try decoder.decode(Model.self, from: data)
                DispatchQueue.main.async {
                    completion(model)
                }
            } catch {
                print("Failed to decode: \(error)")
            }
        }
        
        dataTask.resume()
    }
}
