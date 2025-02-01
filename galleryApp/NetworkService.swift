//
//  NetworkService.swift
//  galleryApp
//
//  Created by Anna Melekhina on 28.01.2025.
//

import UIKit

protocol NetworkServiceDelegate {
    func didUpdateData(artists: [ArtistModel])
    func didFailWithError(error: Error)
}

struct NetworkService {
    
    
    var delegate: NetworkServiceDelegate?

   let url = "https://cdn.accelonline.io/OUR6G_IgJkCvBg5qurB2Ag/files/YPHn3cnKEk2NutI6fHK04Q.json"
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
             let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Ошибка запроса: \(error.localizedDescription)")
                    return
                }
                
                if let safeData = data {
                    if let artistModel = self.parseJSON(safeData) {
                        DispatchQueue.main.async {
                            self.delegate?.didUpdateData(artists: artistModel)
                        }
                    }
                }
            }
            
             task.resume()
        }
    }
    
    func parseJSON(_ artistData: Data) -> [ArtistModel]? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(ArtistData.self, from: artistData)
            
            let artistModels = decodedData.artists.map { artist in
                        ArtistModel(
                            name: artist.name,
                            bio: artist.bio,
                            image: artist.image/*,*/
//                            works: artist.works.map { work in
//                                Works(title: work.title, image: work.image, info: work.info)
//                            }
                        )
                    }
                    
                    return artistModels
            
        } catch {
            print("Ошибка декодирования: \(error)")
            return nil
        }
    }
}
