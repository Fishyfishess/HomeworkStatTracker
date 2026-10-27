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
    var Homework : [Homework]
    init(Homework: [Homework]) {
        self.Homework = Homework
    }
}
