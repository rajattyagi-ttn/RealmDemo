//
//  StudentTableViewCell.swift
//  RealmDB Demo
//
//  Created by Rajat Tyagi on 01/07/20.
//  Copyright © 2020 Rajat Tyagi. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    func setupCell(student: Student) {
        self.nameLabel.text = "\(student.firstName!) \(student.lastName!)"
        self.courseLabel.text = "Course : \(student.course!)"
        self.idLabel.text = "ID: \(student.id.description)"
        self.yearLabel.text = "Year : \(student.year.description)"
    }
}
