//
//  Video.swift
//  youtube-onedaybuild
//
//  Created by Maher Al-Bunni on 4/17/22.
//

import Foundation


struct Video : Decodable {
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnil = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        case snippet = "snippet"
        case thumbnails = "thumbnails"
        case high = "high"
        case resourceId = "resourceId"
        
        case published = "publishedAt"
        case title = "title"
        case videoId = "videoId"
        case thumbnil = "url"
        case description = "description"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        // Parsing the title property
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        // Parsing the description property
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        // Parsing the published date property
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        // Parsing thumbnail
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        // Parsing the url
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        // Parsing the Video url
        self.thumbnil = try highContainer.decode(String.self, forKey: .thumbnil)
        // Parsing the Video Id
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        // Parsing the video id
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
}
