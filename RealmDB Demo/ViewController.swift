//
//  ViewController.swift
//  RealmDB Demo
//
//  Created by Rajat Tyagi on 01/07/20.
//  Copyright © 2020 Rajat Tyagi. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        try! realm.write() {
            realm.delete(realm.objects(Student.self))
        }
        
        createStudents()
        printStudents()
    }
    
    func createStudents() {
        let rajat = Student()
        rajat.firstName = "Rajat"
        rajat.lastName = "Tyagi"
        rajat.year = 4
        rajat.id = 1
        
        let aman = Student()
        aman.firstName = "Aman"
        aman.lastName = "Thakur"
        aman.year = 1
        aman.id = 2
        
        let sehej = Student()
        sehej.firstName = "Sehej"
        sehej.lastName = "Alang"
        sehej.year = 3
        sehej.id = 3
        
        
        try! realm.write {
            realm.add(rajat)
            realm.add(aman)
            realm.add(sehej)
        }
        
    }
    
    func printStudents() {
        let students = realm.objects(Student.self)
        for student in students {
            print(student.firstName)
        }
    }


}

