//
//  SingleProjectCell.swift
//  Officium2
//
//  Created by Annegret Junker on 26.08.19.
//  Copyright © 2019 Annegret Junker. All rights reserved.
//

import UIKit

class SingleProjectCell: UITableViewCell {
    
    var project: ProjectModel = ProjectModel()
    
    var projectImage: UIImageView = {
        let img=UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius=10
        img.clipsToBounds=true
        return img
    }()
    
    let projectNameLabel:UILabel = {
        let label=UILabel()
        label.font=UIFont.boldSystemFont(ofSize: 20)
        label.textColor =  #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let progressView: DayProgressView = {
        let progress=DayProgressView()
        progress.startDate="2020-12-31"
        progress.endDate="2019-01-01"
        return progress
    }()
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()

    override init  (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(projectImage)
        containerView.addSubview(projectNameLabel)
        containerView.addSubview(progressView)
        self.contentView.addSubview(containerView)
        
        projectImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        //projectImage.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor, constant: 10).isActive = true
        //projectImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        //projectImage.heightAnchor.constraint(equalToConstant: 60).isActive=true
        
        //containerView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        //containerView.leadingAnchor.constraint(equalTo: projectImage.trailingAnchor, constant: 10).isActive = true
        //containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        //containerView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        //projectNameLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
        //projectNameLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        //projectNameLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
        
        //progressView.topAnchor.constraint(equalTo: self.projectNameLabel.bottomAnchor, constant: 10).isActive = true
        //progressView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        setContent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setContent() {
        self.projectNameLabel.text=project.name
        self.progressView.startDate=project.createdAt!
        self.progressView.endDate=project.dueDate!
        self.progressView.calculateProgress()
        self.progressView.setTint()
        self.projectImage=UIImageView(image: UIImage(named: "officiumLogogSmall"))
    }

}
