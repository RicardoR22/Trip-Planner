//
//  NewTripView.swift
//  Trip Planner
//
//  Created by Ricardo Rodriguez on 5/11/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class AddTripView: UIView {

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
        addSubview(nameLabel)
        addSubview(tripNameField)
    }
    
    var nameLabel: UILabel = {
        let textField = UILabel()
        textField.layer.cornerRadius = 5
        textField.textColor = .black
        textField.font = UIFont.boldSystemFont(ofSize: 18)
        textField.textAlignment = .center
        
        textField.text = "Give this trip a name!"
        return textField
    }()
    
    let tripNameField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no

        return textField
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
