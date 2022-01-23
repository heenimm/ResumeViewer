//
//  ResumeScreenPresenter.swift
//  ResumeViewer
//
//  Created by Халим Магомедов on 16.01.2022.
//

import Foundation

protocol ResumeScreenViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
    
}

protocol ResumeScreenPresenterProtocol: AnyObject {
    func getResume()
    var resume: ResumeData? {get set}
}

class ResumeScreenPresenter: ResumeScreenPresenterProtocol {
    var resume: ResumeData?
    weak var view: ResumeScreenViewProtocol?
    let networkService: NetworkServiceProtocol!
    required init(view: ResumeScreenViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
    }
    
    func getResume() {
        networkService.request (success: { [weak self] response in
            
            guard let self = self else { return }
            self.resume = response
            self.view?.success()

        }, failure: {
            print("Error")

        })
    }
}
