//
//  TaskOverviewSectionHeaderView.swift
//  Officium2
//
//  Created by Annegret Junker on 28.08.19.
//  Copyright © 2019 Annegret Junker. All rights reserved.
//

import UIKit

protocol TaskOverviewSectionHeaderViewDelegate {
    func toggleSection(header: TaskOverviewSectionHeaderView, section: Int)
}

class TaskOverviewSectionHeaderView: UIView {

    var sectionHeaderLabel: UILabel!
    var sectionCollapsableButton: UIButton!
    
    var Right: UIImage = UIImage(named: "Right.png")!
    var Down: UIImage = UIImage(named: "Down.png")!
    
    var collapsed = false
    var sectionNumber: Int = 0
    var parent: TasksTableController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        sectionHeaderLabel = UILabel()
        sectionHeaderLabel.frame = CGRect (x: 40, y: 0, width: 300, height: 30)
        self.addSubview(sectionHeaderLabel)
        
        sectionCollapsableButton = UIButton()
        sectionCollapsableButton.setImage(Right, for: .normal)
        sectionCollapsableButton.frame = CGRect (x: 5, y: 5, width: 20, height: 20)
        sectionCollapsableButton.addTarget(self, action: #selector(Collaps), for: .touchUpInside)
        self.addSubview(sectionCollapsableButton)
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc func Collaps(sender: UIButton!) {
        if (collapsed) {
            collapsed = false
            sectionCollapsableButton.setImage(Right, for: .normal)
        } else {
            collapsed = true
            sectionCollapsableButton.setImage(Down, for: .normal)
        }
        parent?.collapsedForSection[sectionNumber]=collapsed
        parent?.tableView.reloadData()
        
    }

}
