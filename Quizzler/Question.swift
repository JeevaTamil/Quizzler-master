//
//  Question.swift
//  Quizzler
//
//  Created by Jeeva Tamil on 14/09/17.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    let question: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        question = text
        answer = correctAnswer
    }
}
