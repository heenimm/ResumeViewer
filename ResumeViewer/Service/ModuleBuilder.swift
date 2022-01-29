//
//  ModuleBuilder.swift
//  ResumeViewer
//
//  Created by Халим Магомедов on 16.01.2022.
//

import UIKit
protocol AssemblyBuilderProtocol {
    func createResumeModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(resume: Resume?, router: RouterProtocol) -> UIViewController

}

class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    func createResumeModule(router: RouterProtocol) -> UIViewController {
        let view = ResumeScreenViewController()
        let networkService = NetworkService()
        let presenter = ResumeScreenPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }
    func createDetailModule(resume: Resume?, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, resume: resume, router: router)
        view.presenter = presenter
        return view
    }
    
}
