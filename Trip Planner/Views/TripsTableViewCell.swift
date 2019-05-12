//
//  TripsTableViewCell.swift
//  Trip Planner
//
//  Created by Ricardo Rodriguez on 5/11/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class TripsTableViewCell: UITableViewCell {

    let label = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 20).isActive = true
        label.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -20).isActive = true
        label.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        label.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
