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
            }
        }
        
        print(winnerName)
        print(answers)
       
    
    }
}
