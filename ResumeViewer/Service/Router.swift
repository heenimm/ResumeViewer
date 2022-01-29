//
//  RouterProtocol.swift
//  ResumeViewer
//
//  Created by Халим Магомедов on 28.01.2022.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? {get set}
    var assemblyBuilder: AssemblyBuilderProtocol? {get set}
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showDetail(resume: Resume?)
    func popToRoot()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init (navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol){
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
     
    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createResumeModule(router: self) else {return}
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func showDetail(resume: Resume?) {
        if let navigationController = navigationController {
            guard let detailViewController  = assemblyBuilder?.createDetailModule(resume: resume, router: self) else {return}
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }

    
}
