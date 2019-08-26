//
//  DayProgressView.swift
//  Officium2
//
//  Created by Annegret Junker on 26.08.19.
//  Copyright © 2019 Annegret Junker. All rights reserved.
//

import UIKit

class DayProgressView: UIProgressView {
    
    var startDate: String = "2019-01-01"
    var endDate: String = "2019-12-31"
    
    override func awakeFromNib() {
        let progress: Float = OfficiumUtilities.CalculateProgress(StartDate: startDate, EndDate: endDate)
        if progress>0.5 && progress<=0.8 {
            self.tintColor = .green
        } else if progress>0.8 && progress<=0.9{
            self.tintColor = .yellow
        } else if progress>0.9 {
            self.tintColor = .red
        } else {
            self.tintColor = .blue
        }
        self.progress=progress
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
