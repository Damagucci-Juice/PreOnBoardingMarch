//
//  ImageService.swift
//  ConcurrentlyImageApp
//
//  Created by YEONGJIN JANG on 2023/02/24.
//

import Foundation

class ImageService {
    func loadImage(completion: @escaping (Result<Data, ImageError>) -> Void) {
        guard let url = URL(string: "https://picsum.photos/200")
        else { return completion(.failure(.urlGeneration)) }
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else { return completion(.failure(.errorFromServer)) }
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
                    200..<300 ~= statusCode
            else { return completion(.failure(.statusCodeOut))}
            guard let data = data
            else { return completion(.failure(.dataEmpty)) }
            
            completion(.success(data))
        }
        
        task.resume()
    }
}
