//
//  NetworkService.swift
//  ResumeViewer
//
//  Created by Халим Магомедов on 16.01.2022.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func request(completion: @escaping (Result<ResumeData, Error>) -> Void )
}

class NetworkService: NetworkServiceProtocol {
    
    func request(completion: @escaping (Result<ResumeData, Error>) -> Void ) {
        let urlString = "http://app.cre.ru/api8/PlayersPersonList"
        AF.request(urlString, method: .get, parameters: nil).responseJSON(completionHandler:
                                                                            { (response) in
                                                                                if let data = response.data {
                                                                                    do {
                                                                                        let result = try JSONDecoder().decode(ResumeData.self, from: data)
                                                                                        completion(.success(result))
                                                                                    } catch {
                                                                                        completion(.failure(error))
                                                                                    }
                                                                                }
                                                                            })
    }
}
