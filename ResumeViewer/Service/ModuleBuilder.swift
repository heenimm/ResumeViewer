//
//  ModuleBuilder.swift
//  ResumeViewer
//
//  Created by Халим Магомедов on 16.01.2022.
//

import UIKit
protocol Builder {
    static func createResumeModule() -> UIViewController
    static func createDetailModule(resume: Resume?) -> UIViewController

}

class ModuleBuilder: Builder {
    
    static func createResumeModule() -> UIViewController {
        let view = ResumeScreenViewController()
        let networkService = NetworkService()
        let presenter = ResumeScreenPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    static func createDetailModule(resume: Resume?) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, resume: resume)
        view.presenter = presenter
        return view
    }
    
}
