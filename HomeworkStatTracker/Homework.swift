//
//  Homework.swift
//  HomeworkStatTracker
//
//  Created by ALVIN WEI on 10/27/26.
//

import Foundation
struct Homework{
    //each one can store multiple of similar homework
    //each instance of this struct is for each homework type, per subject
    var homeworkType: String
    var homeworkName: [String]
    var homeworkRating : [Int]
    var homeworkDifficulty : [Int]
    var subject: [String]
}
