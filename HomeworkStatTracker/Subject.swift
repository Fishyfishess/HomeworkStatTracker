//
//  Subject.swift
//  HomeworkStatTracker
//
//  Created by ALVIN WEI on 10/27/26.
//

import Foundation
class Subject{
    //make multiple subjects, one for each subject
    //stores all of the different homeworks, for this subject
    var homework : [[Homework]] = [[]]
    //each row is one type of homework
    
    //dictionary that records the homework type and its index
    var homeworkType: [String:Int] = [:]
    init(Homework: [[Homework]]) {
    }
    
}
