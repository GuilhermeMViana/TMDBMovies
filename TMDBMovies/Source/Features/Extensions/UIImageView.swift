//
//  UIImageView.swift
//  TMDBMovies
//
//  Created by Guilherme Muniz Viana on 21/08/25.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        // Use task to download asynchronous
        Task {
            do {
                let (data, _) =  try await URLSession.shared.data(from: url)
                // Convert data into a image
                guard let image = UIImage(data: data) else {return}
                
                DispatchQueue.main.async {
                    self.image = image
                }
            } catch { print(error.localizedDescription) }
        }
    }
}
