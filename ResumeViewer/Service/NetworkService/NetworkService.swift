//
//  NetworkService.swift
//  ResumeViewer
//
//  Created by Халим Магомедов on 16.01.2022.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func request(success: @escaping (ResumeData) -> (), failure: @escaping () -> () )
}

class NetworkService: NetworkServiceProtocol {

func request(success: @escaping (ResumeData) -> (), failure: @escaping () -> () ) {
           let urlString = "http://app.cre.ru/api8/PlayersPersonList"
               AF.request(urlString, method: .get, parameters: nil).responseJSON(completionHandler:
                   { (response) in
                   switch response.result {
                       case .success:
                           if let data = response.data {
                               do {
                                   let result = try JSONDecoder().decode(ResumeData.self, from: data)
                                   success(result)
//                                print(result.data)
                               } catch {
                                   failure()
                               }
                           } else {
                               failure()
                           }
                       case .failure:
                           failure()
                           print("ERROR")
                       }
               })

           }
}
