//
//  Response.swift
//  youtube-onedaybuild
//
//  Created by Maher Al-Bunni on 4/21/22.
//

import Foundation


struct Response: Decodable {
    var items: [Video]?
    
    enum CodingKeys: String,CodingKey {
        case items = "items"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
    }
}
