//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNumber: Int = 0
    var score: Int = 0
    
    //Place your instance variables here
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = allQuestions.list[questionNumber].question
        scoreLabel.text = "\(score)"
        progressLabel.text = "\(questionNumber + 1)/13"

    }
    
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        print("question capacity -", allQuestions.list.count)
        print("current question -",questionNumber)
        
        pickedAnswer = (sender.tag == 1) ? true: false
        
        checkAnswer()
        nextQuestion()
    }
    
    
    func updateUI() {
        
        scoreLabel.text = "\(score)"
        progressLabel.text = "\(questionNumber + 1)/13"
        
        progressBar.frame.size.width = (view.frame.size.width) / 13 * CGFloat(questionNumber + 1)
    }
    
    
    func nextQuestion() {
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].question
            
            updateUI()
        }else {
           
            let alert = UIAlertController.init(title: "Great!", message: "Do you wanna try again?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "restart", style: .default) { (alertAction) in
                
                self.startOver()
                
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alert.addAction(restartAction)
            alert.addAction(cancelAction)
            
            present(alert, animated: true, completion: nil)


        }
    }
    
    
    func checkAnswer() {
        let currectAnswer = allQuestions.list[questionNumber].answer
        
        if currectAnswer == pickedAnswer{
            ProgressHUD.showSuccess("Correct Answer!")
            
            print("correct Answer!")
            score = score + 1
        }else{
            ProgressHUD.showError("Wrong!")
            print("Wrong!")
        }
        
        questionNumber += 1

    }
    
    
    func startOver() {
        questionNumber = 0
        score = 0
        nextQuestion()
        
        
    }
    
    
    
}
