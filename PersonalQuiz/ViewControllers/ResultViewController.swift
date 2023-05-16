//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Vasichko Anna on 15.05.2023.
//

import UIKit

final class ResultViewController: UIViewController {

    var answersChosen: [Answer]!
    override func viewDidLoad() {
        super.viewDidLoad()
        getFinalResult()
        navigationItem.hidesBackButton = true
    }

    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("ResultViewController is deallocated")
    }
    
    private func getFinalResult(){
        
        var answers = ["dog": 0, "cat": 0, "rabbit": 0, "turtle": 0]
        
        var winnerScore = 0
        var winnerName = ""
        var winnerIndex = 0
        
        for answer in answersChosen {
            switch answer.animal {
            case .dog:
                answers["dog"]! += 1
            case .cat:
                answers["cat"]! += 1
            case .rabbit:
                answers["rabbit"]! += 1
            default:
                answers["turtle"]! += 1
            }
        }
        
        for answer in answers{
            if answer.value > winnerScore {
                winnerScore = answer.value
                winnerName = answer.key
                switch winnerName{
                    case "dog": winnerIndex = 0
                    case "cat": winnerIndex = 1
                    case "rabbit": winnerIndex = 2
                    default: winnerIndex = 3
                }
            }
        }
       
        print(winnerName)
        print(winnerIndex)
        print(answers)
    
    }
}
