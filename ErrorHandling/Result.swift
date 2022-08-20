//
//  Result.swift
//  ErrorHandling
//
//  Created by Yaz Burrell on 8/17/22.
//

import Foundation


enum NetworkError: Error {
    case badURL
}


func fetchUnreadCount1(from urlString: String, completionHandler: @escaping (Result<Int, NetworkError>) -> Void) {
    guard let url = URL(string: urlString) else {
        completionHandler(.failure(.badURL))
        return
    }
    
    print("Fetching \(url.absoluteString)....")
    completionHandler(.success(5))
}

//fetchUnreadCount1(from: "https://www.hackingwithswift.com") { result in
//    switch result {
//    case .success(let count):
//        print("\(count) unread messages.")
//    case .failure(let error):
//        print(error.localizedDescription)
//    }
//}

func fetchUnreadCount2(from urlString: String, completionHandler: @escaping(Int?, NetworkError?) -> Void) {
    guard let url = URL(string: urlString) else {
        completionHandler(nil, .badURL)
        return
    }
    
    print("Fetching \(url.absoluteString)...")
    completionHandler(5, nil)
}
