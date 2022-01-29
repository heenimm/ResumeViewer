//
//  DetailViewController.swift
//  ResumeViewer
//
//  Created by Халим Магомедов on 18.01.2022.
//

import UIKit
import SnapKit
import SDWebImage

class DetailViewController: UIViewController {
    var presenter: DetailViewPresenterProtocol!
    
    weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setResume()
        view.backgroundColor = .white
        setViews ()
        constraintsPortrait ()
    }
    
    lazy var fullNameLabel: UILabel! = { let nmLabel = UILabel(text: "", font: .boldSystemFont(ofSize: 25))
        nmLabel.numberOfLines = 0
        nmLabel.textAlignment = .center
        return nmLabel
    }()
    
    lazy var personImage: UIImageView = {
        let prsnImage = UIImageView(cornerRadius: view.frame.size.width / 6 )
        return prsnImage
    }()
    
    
    lazy var companyNameLabel: UILabel! = {
        let cmpnLabel = UILabel()
        cmpnLabel.numberOfLines = 0
        return cmpnLabel
    }()
    
    lazy var kindOfActivityeLabel: UILabel! = {
       let kndLabel = UILabel()
       return kndLabel
   }()
    
    
   
    
    func constraintsLandscape (){
        personImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(70)
        }
    }
    
    func constraintsPortrait (){
        personImage.snp.makeConstraints {
            $0.width.height.equalTo(200)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(view.frame.height / 3)
        }
        
        fullNameLabel.snp.makeConstraints {
            $0.right.left.equalToSuperview().inset(100)
            $0.top.equalTo(personImage.snp.bottom).offset(20)
        }
              
        companyNameLabel.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(fullNameLabel.snp.bottom).offset(4)
        }
        
        kindOfActivityeLabel.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(companyNameLabel.snp.bottom).offset(4)
        }
    }

    
    func setViews (){
        view.backgroundColor = #colorLiteral(red: 0.9761081524, green: 0.9761081524, blue: 0.9761081524, alpha: 1)
        [fullNameLabel,personImage,companyNameLabel, kindOfActivityeLabel].forEach{view.addSubview($0)}
    }
        
}



extension DetailViewController: DetailViewProtocol {
    func setResume(resume: Resume?) {
        fullNameLabel.text = resume?.fio
        companyNameLabel.text = resume?.company
        kindOfActivityeLabel.text = resume?.activity
        personImage.sd_setImage(with: URL(string: resume?.photo ?? ""), placeholderImage: UIImage(named: "no_people"))
        
    }
    
    
}
