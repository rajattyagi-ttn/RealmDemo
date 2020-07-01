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

    @IBOutlet weak var studentTableView: UITableView!
    
    let realm = try! Realm()
    
    var studentsArray: [Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        try! realm.write() {
            realm.delete(realm.objects(Student.self))
        }
        
        createStudents()
        printStudents()
        
        
        let nib = UINib.init(nibName: "StudentTableViewCell", bundle: nil)
        studentTableView.register(nib, forCellReuseIdentifier: "StudentTVCell")
        
    }
    
    func createStudents() {
        let rajat = Student()
        rajat.firstName = "Rajat"
        rajat.lastName = "Tyagi"
        rajat.year = 4
        rajat.id = 1
        rajat.course = "BTech"
        
        let aman = Student()
        aman.firstName = "Aman"
        aman.lastName = "Thakur"
        aman.year = 1
        aman.id = 2
        aman.course = "Mtech"
        
        let sehej = Student()
        sehej.firstName = "Sehej"
        sehej.lastName = "Alang"
        sehej.year = 3
        sehej.id = 3
        sehej.course = "BBA"
        
        try! realm.write {
            realm.add(rajat)
            realm.add(aman)
            realm.add(sehej)
        }
        
    }
    
    func printStudents() {
        let students = realm.objects(Student.self)
//        studentsArray = students
        for student in students {
            print(student.firstName)
            
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let students = realm.objects(Student.self)
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let students = realm.objects(Student.self)
        let studentCell = studentTableView.dequeueReusableCell(withIdentifier: "StudentTVCell", for: indexPath) as! StudentTableViewCell
        studentCell.setupCell(student: students[indexPath.row])
        return studentCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
