//
//  ModelMainScreen.swift
//  ResumeViewer
//
//  Created by Халим Магомедов on 15.01.2022.
//

import Foundation

struct ResumeData: Codable {
    var error: Int
    var data: [Resume]
}

struct Resume: Codable {
    var id: Int?
    var fio: String?
    var sex: String?
    var post: String?
    var company: String?
    var actual_company: Int?
    var activity: String?
    var photo: String?
}


