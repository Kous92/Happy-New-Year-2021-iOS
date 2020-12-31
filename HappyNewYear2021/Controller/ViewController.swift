//
//  ViewController.swift
//  HappyNewYear2021
//
//  Created by Koussaïla Ben Mamar on 27/12/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var timerButton: CustomButton!
    
    var countdownTimer = Timer()
    var seconds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timer.isHidden = true
    }

    @IBAction func countdownButton(_ sender: Any) {
        countdownTimer.invalidate()
        seconds = 10
        
        // Compte à rebours activé, le bouton disparaît
        timer.isHidden = false
        timerButton.isHidden = true
        
        // Compte à rebours, la fonction Objective-C countdown se déclenche toute les secondes avec le paramètre timeInterval à 1.
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countdown), userInfo: nil, repeats: true)
    }
    
    @objc func countdown() {
        seconds -= 1
        timer.text = String(seconds)
        
        if seconds == 0 {
            timerButton.isHidden = false
            timer.isHidden = true
            timer.text = "10" // Si on souhaite recommencer, sinon on voit "0"
            countdownTimer.invalidate() // Le compteur est désactivé.
            
            // On s'assure que le ViewController pour l'image festive soit présente
            guard let vc = storyboard?.instantiateViewController(identifier: "happy_new_year_vc") as? HappyNewYearViewController else {
                return
            }
            
            vc.modalPresentationStyle = .fullScreen // Écran complet
            present(vc, animated: true) // On transite sur l'autre vue pour souhaiter "Bonne année 2021"
        }
    }
}
