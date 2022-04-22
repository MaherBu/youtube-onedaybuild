//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by Maher Al-Bunni on 4/17/22.
//

import Foundation

protocol ModelDelegate {
    func videosFetched(_ videos:[Video])
}

class Model {
    
    var delegate:ModelDelegate?
    
    func getVideos() {
        /// Create  a URL Object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        /// Get a URL Session Object
        let session = URLSession.shared
        
        /// Get a Data Task from the URLSession Object
        let dataTask = session.dataTask(with: url!) { data, response, error in
            // Check if there were any error
            if error != nil || data == nil {
                return
            }
            
            
            do {
                // Parsing the data in to Video object
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    DispatchQueue.main.async {
                        // Call The "videosFetched" Method of the delegate
                        self.delegate?.videosFetched(response.items!)
                    }
                }
                
                dump(response)
            }
            catch {
                
            }
        }
        /// Kick off the task
        dataTask.resume()
    }
    
}
