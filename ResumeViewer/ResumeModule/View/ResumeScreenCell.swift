
//  ResumeViewer
//
//  Created by Халим Магомедов on 16.01.2022.
//

import Foundation
import UIKit
import SnapKit

class ResumeScreenCell: UITableViewCell {
    static let identifier = "resumeCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutSubviews()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = contentView.frame.size.height / 9
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = #colorLiteral(red: 0.9761081524, green: 0.9761081524, blue: 0.9761081524, alpha: 1)
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        [fullNameLabel,personImage,companyNameLabel, kindOfActivityeLabel].forEach{contentView.addSubview($0)}
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
        contentView.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
        
        personImage.snp.makeConstraints {
            $0.width.height.equalTo(100)
            $0.top.equalTo(contentView.snp.top).inset(16)
            $0.left.equalTo(contentView.snp.left).inset(16)
        }
        
        fullNameLabel.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.right.equalTo(contentView.snp.right).inset(40)
            $0.top.equalTo(contentView.snp.top).inset(20)
            $0.left.equalTo(personImage.snp.right).offset(16)
        }
        
        companyNameLabel.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.right.equalTo(contentView.snp.right).inset(40)
            $0.top.equalTo(fullNameLabel.snp.bottom).offset(16)
            $0.left.equalTo(personImage.snp.right).offset(16)
        }
        
        kindOfActivityeLabel.snp.makeConstraints {
            $0.right.equalTo(contentView.snp.right).inset(40)
            $0.top.equalTo(companyNameLabel.snp.bottom).offset(4)
            $0.left.equalTo(personImage.snp.right).offset(16)
        }
    }
    
    lazy var personImage: UIImageView = {
        let prsnImage = UIImageView(cornerRadius: self.frame.size.width / 6)
        prsnImage.image = UIImage(named: "no_people")
        return prsnImage
    }()
    
    lazy var fullNameLabel: UILabel! = {
        let nmLabel = UILabel(text: "", font: .monospacedSystemFont(ofSize: 20, weight: .bold))
        return nmLabel
    }()
    
    lazy var companyNameLabel: UILabel! = {
        let cmpnLabel = UILabel(text: "", font: .boldSystemFont(ofSize: 15))
        cmpnLabel.numberOfLines = 0
        return cmpnLabel
    }()
    
    lazy var kindOfActivityeLabel: UILabel! = {
        let kndLabel = UILabel(text: "", font: .italicSystemFont(ofSize: 11))
        kndLabel.numberOfLines = 0
        return kndLabel
    }()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

