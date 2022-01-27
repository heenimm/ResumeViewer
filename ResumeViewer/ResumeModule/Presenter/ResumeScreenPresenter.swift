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
        networkService.request { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let value):
                self.resume = value
                self.view?.success()
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
}
