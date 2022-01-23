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
}


class DetailPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol!
    var resume: Resume?
    
    init (view: DetailViewProtocol, networkService: NetworkServiceProtocol,  resume: Resume?) {
        self.view = view
        self.networkService = networkService
        self.resume = resume
        
    }
    public func setResume() {
        self.view?.setResume(resume: resume)
    }
    
    
}
