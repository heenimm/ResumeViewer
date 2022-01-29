//
//  DetailViewPresenter.swift
//  ResumeViewer
//
//  Created by Халим Магомедов on 21.01.2022.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setResume(resume: Resume?)
}


protocol DetailViewPresenterProtocol: AnyObject {
    func setResume()
    func tap()
}


class DetailPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol!
    var resume: Resume?
    var router: RouterProtocol?
    
    init (view: DetailViewProtocol, networkService: NetworkServiceProtocol,  resume: Resume?, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.resume = resume
        self.router = router
    }
    
    public func setResume() {
        self.view?.setResume(resume: resume)
    }
    
    func tap() {
        router?.popToRoot()
    }
}
