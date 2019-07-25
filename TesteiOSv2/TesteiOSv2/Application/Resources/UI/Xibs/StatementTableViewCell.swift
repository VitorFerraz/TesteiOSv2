//
//  StatementTableViewCell.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 21/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import UIKit

class StatementTableViewCell: UITableViewCell {

    @IBOutlet weak var lbAmount: UILabel!
    @IBOutlet weak var lbBill: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbPayment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //clean()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //clean()
    }

    final fileprivate func clean() {
        lbAmount.text = nil
        lbBill.text = nil
        lbDate.text = nil
        lbPayment.text = nil
    }
    
    func prepare(viewModel: StatementViewModel) {
        lbAmount.text = viewModel.value
        lbBill.text = viewModel.description
        lbPayment.text = viewModel.title
        lbDate.text = viewModel.date
    }
}
