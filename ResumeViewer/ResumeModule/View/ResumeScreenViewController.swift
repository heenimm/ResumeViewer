//
//  ViewController.swift
//  ResumeViewer
//
//  Created by Халим Магомедов on 15.01.2022.
//

import UIKit
import SDWebImage

class ResumeScreenViewController: UIViewController {
    var resumeTableView = UITableView()
    var presenter: ResumeScreenPresenterProtocol!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "All resumes"
        presenter.getResume()
        createTableView ()
    }
    
    private func createTableView (){
        resumeTableView = UITableView(frame: view.bounds, style: .plain)
        resumeTableView.rowHeight = UITableView.automaticDimension
        resumeTableView.translatesAutoresizingMaskIntoConstraints = false
        resumeTableView.register(ResumeScreenCell.self, forCellReuseIdentifier: ResumeScreenCell.identifier)
        resumeTableView.separatorStyle = .none
        resumeTableView.showsVerticalScrollIndicator = false
        resumeTableView.delegate = self
        resumeTableView.dataSource = self
        resumeTableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.addSubview(resumeTableView)
    }
}

//MARK: - delegate, dataSource
extension ResumeScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  presenter.resume?.data.count ?? 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ResumeScreenCell.identifier, for: indexPath) as! ResumeScreenCell
        if let resumePerson = self.presenter.resume?.data[indexPath.row] {
            cell.fullNameLabel.text = resumePerson.fio
            cell.companyNameLabel.text = resumePerson.company
            cell.kindOfActivityeLabel.text = resumePerson.post
            cell.personImage.sd_setImage(with: URL(string: resumePerson.photo ?? ""), placeholderImage: UIImage(named: "no_people"))
        }
        return cell
    }
}


extension ResumeScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let resumePerson = self.presenter.resume?.data[indexPath.row]
        presenter.tapOnTheResume(resume: resumePerson)
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}

extension ResumeScreenViewController: ResumeScreenViewProtocol{
    
    func success() {
        resumeTableView.reloadData()
    }
    func failure(error: Error) {
        print(String(describing: error))
    }
}
