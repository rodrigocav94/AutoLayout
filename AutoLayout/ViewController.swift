//
//  ViewController.swift
//  AutoLayout
//
//  Created by Rodrigo Cavalcanti on 09/04/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false // TAMIC, which means we have to make our constraints by hand, auto resizing masks is an Old iOS way of doing layout.
        label1.backgroundColor = .red
        label1.text = "THESE"
        label1.sizeToFit()
        
        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false // TAMIC
        label2.backgroundColor = .cyan
        label2.text = "ARE"
        label2.sizeToFit()
        
        let label3 = UILabel()
        label3.translatesAutoresizingMaskIntoConstraints = false // TAMIC
        label3.backgroundColor = .yellow
        label3.text = "SOME"
        label3.sizeToFit()
        
        let label4 = UILabel()
        label4.translatesAutoresizingMaskIntoConstraints = false // TAMIC
        label4.backgroundColor = .green
        label4.text = "AWESOME"
        label4.sizeToFit()
        
        
        let label5 = UILabel()
        label5.translatesAutoresizingMaskIntoConstraints = false // TAMIC
        label5.backgroundColor = .orange
        label5.text = "LABELS"
        label5.sizeToFit()
        
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
        
        
        // VISUAL FORMAT LANGUAGE
        
        let viewsDictionary = ["label1": label1, "label2": label2, "label3": label3, "label4": label4, "label5": label5]
        
        for label in viewsDictionary.keys {
            view // Main View
                .addConstraints( // Adds an array of constraints to View
                    NSLayoutConstraint.constraints( // Auto Layout method that converts VFL into an array of constraints
                        withVisualFormat: "H:|[\(label)]|", //  H: means horizontal, | means edge, H:|[label1]| means "horizontally, I want my label1 to go edge to edge in my view."
                        options: [],
                        metrics: nil,
                        views: viewsDictionary
                    )
                )
        }
        
        let metrics = ["labelHeight": 88]
        
        view
            .addConstraints(
                NSLayoutConstraint.constraints(
                    withVisualFormat: "V:|[label1(labelHeight@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]-(>=10)-|",
                    options: [],
                    metrics: metrics,
                    views: viewsDictionary
                )
            )
        
    }


}

