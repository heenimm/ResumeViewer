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
    func tapOnTheResume(resume: Resume?)
    var resume: ResumeData? {get set}
}

class ResumeScreenPresenter: ResumeScreenPresenterProtocol {
    func tapOnTheResume(resume: Resume?) {
        router?.showDetail(resume: resume)
    }
    
    var resume: ResumeData?
    var router: RouterProtocol?
    weak var view: ResumeScreenViewProtocol?
    let networkService: NetworkServiceProtocol!
    required init(view: ResumeScreenViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
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
