//
//  Homework.swift
//  HomeworkStatTracker
//
//  Created by ALVIN WEI on 10/27/26.
//

import Foundation
import SwiftData

@Model
class Homework{
    
    //each one can store one homework
    //save these into subject
    var homeworkType: String
    var homeworkName: String
    var homeworkRating : Int
    var homeworkDifficulty : Int
    var subject: String
    var dueDate: Date
    var timeSpent: Int
    var uid = UUID()
    init(homeworkType: String, homeworkName: String, homeworkRating: Int, homeworkDifficulty: Int, subject: String, dueDate: Date, timeSpent: Int, uid: UUID = UUID()) {
        self.homeworkType = homeworkType
        self.homeworkName = homeworkName
        self.homeworkRating = homeworkRating
        self.homeworkDifficulty = homeworkDifficulty
        self.subject = subject
        self.dueDate = dueDate
        self.timeSpent = timeSpent
        self.uid = uid
    }
}
