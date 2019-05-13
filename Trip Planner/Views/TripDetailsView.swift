//
//  TripDetailsView.swift
//  Trip Planner
//
//  Created by Ricardo Rodriguez on 5/12/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class TripDetailsView: UIView {
    
    var trip: Trip?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    func setupView() {
        backgroundColor = .white
        setupSubViews()
        setViewConstraints()
    }
    
    func setupSubViews() {
        addSubview(noWaypointsLabel)
        addSubview(getStartedBtn)
    }
    
    var noWaypointsLabel: UILabel = {
        let textField = UILabel()
        textField.layer.cornerRadius = 5
        textField.numberOfLines = 2
        textField.textColor = .black
        textField.font = UIFont.boldSystemFont(ofSize: 18)
        textField.textAlignment = .center
        textField.text = "You haven't added any waypoints to your trip!"
        
        return textField
    }()
    
    var getStartedBtn: UIButton = {
        let button = UIButton()
        let buttonText = NSMutableAttributedString(attributedString: NSAttributedString(string: "Get Started!", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor(red: 0/255, green: 139/255, blue: 139/255, alpha: 1)]))
        button.backgroundColor = .white
        button.setAttributedTitle(buttonText, for: .normal)
        
        return button
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
