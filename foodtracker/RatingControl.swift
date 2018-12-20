//
//  RatingControl.swift
//  foodtracker
//
//  Created by Neil Ling on 2018/12/19.
//  Copyright © 2018 Neil Ling. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    // MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }
    
    // MARK: private methods
    private func setupButtons() {
        let button = UIButton()
        button.backgroundColor = UIColor.red
        
        // add constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        // setup the button action
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
        
        // add the button to the stack
        addArrangedSubview(button)
    }

}
