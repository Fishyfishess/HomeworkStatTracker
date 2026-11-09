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
    var homework : [Homework] = []
    //each row is one type of homework
    var data : [String : Int] = [:]
    //dictionary that records the homework type and its index
    //var homeworkType: [String:Int] = ["English": 0, "Math": 1, "Science": 2, "Social science": 3, "Computer science": 4]
    init() {
    }
    
    func analyzeRating(homeworkType: String) -> Double {
        var totalRating = 0.0
        for i in 0..<homework.count {
            if homework[i].homeworkType == homeworkType{
                totalRating += Double((homework[i].homeworkRating))
            }
        }
        return totalRating / Double(homework.count)
    }
    
    func analyzeDifficulty(homeworkType: String) -> Double {
        var totalDifficulty = 0.0
        for i in 0..<homework.count {
            if homework[i].homeworkType == homeworkType{
                totalDifficulty += Double((homework[i].homeworkDifficulty))
            }
        }
        return totalDifficulty / Double(homework.count)
    }
    
    func analyzeTimeSpent(homeworkType: String) -> Double {
        var totalTimeSpent = 0.0
        for i in 0..<homework.count {
            if homework[i].homeworkType == homeworkType{
                totalTimeSpent += Double((homework[i].timeSpent))
            }
        }
        return totalTimeSpent / Double(homework.count)
    }
}
