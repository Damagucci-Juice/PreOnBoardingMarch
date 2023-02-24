//
//  ImageError.swift
//  ConcurrentlyImageApp
//
//  Created by YEONGJIN JANG on 2023/02/24.
//

import Foundation

enum ImageError: Error {
    case urlGeneration
    case dataEmpty
    case statusCodeOut
    case errorFromServer
}
