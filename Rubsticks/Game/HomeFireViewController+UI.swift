//
//  HomeFireViewController+UI.swift
//  Rubsticks
//
//  Created by Michael Roundcount on 6/12/23.
//

import Foundation
import UIKit

extension HomeFireViewController {
    
    func setUpBackground() {
        self.view.backgroundColor = UIColor.black
    }
    
    func setUpScoreTextLbl() {
        scoreLbl.textColor = UIColor.white
        scoreLbl.font = UIFont.boldSystemFont(ofSize: 22)
        scoreLbl.text = "Score: 0"
    }
}
