//
//  Student.swift
//  RealmDB Demo
//
//  Created by Rajat Tyagi on 01/07/20.
//  Copyright © 2020 Rajat Tyagi. All rights reserved.
//

import Foundation
import RealmSwift


class Student: Object {
    @objc dynamic var firstName: String?
    @objc dynamic var lastName: String?
    @objc dynamic var year: Int = 1
    @objc dynamic var course: String?
    @objc dynamic var id: Int = 0
    
}
