//
//  ViewController.swift
//  SqureCatcher
//
//  Created by Damon Cricket on 07.12.2019.
//  Copyright © 2019 DC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel?
    
    var squareView: UIView?
    
    deinit {
        squareView = nil
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(createSquare(timer:)), userInfo: nil, repeats: true)
    }
    
    @objc func createSquare(timer: Timer) {
        if let squareView = squareView {
            squareView.removeFromSuperview()
            self.squareView = nil
        }
        
        let size: CGFloat = 50.0
        let width = Int(view.bounds.width)
        let height = Int(view.bounds.height)
        let offset = Int(scoreLabel!.frame.maxY)
        let x = CGFloat( Int.random(in: 0 ... (width - Int(size)) ) )
        let y = CGFloat( Int.random(in: offset ... (height - Int(size)) ) )
        let squareView = UIView(frame: CGRect(x: x, y: y, width: size, height: size))
        squareView.backgroundColor = .black
        view.addSubview(squareView)
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(squareTap(gestureRecognizer:)))
        squareView.addGestureRecognizer(gestureRecognizer)
        self.squareView = squareView
    }
    
    @objc func squareTap(gestureRecognizer: UITapGestureRecognizer) {
        let squareView = gestureRecognizer.view
        squareView?.removeFromSuperview()
        var score = Int(scoreLabel!.text!) ?? 0
        score += 1
        scoreLabel?.text = "\(score)"
    }
}
