//
//  JewelryModal.swift
//  ExpendCollapse
//
//  Created by Giresh Dora on 28/08/19.
//  Copyright © 2019 Giresh Dora. All rights reserved.
//

import Foundation

// MARK: - JewelryModal
struct JewelryModal: Decodable {
    let name: String?
    let subCategory: [SubCategory]?
    var isExpandable: Bool?
}

// MARK: - SubCategory
struct SubCategory: Decodable {
    let name, displayName: String?
}

