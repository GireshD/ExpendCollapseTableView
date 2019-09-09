//
//  HeaderView.swift
//  ExpendCollapse
//
//  Created by Giresh Dora on 28/08/19.
//  Copyright © 2019 Giresh Dora. All rights reserved.
//

import UIKit

protocol HeaderDeleagte {
    func selectedHeader(index: Int)
}

class HeaderView: UIView {

    var delegate : HeaderDeleagte!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(btn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var btn : UIButton = {
       let btn = UIButton(frame: CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width, height: self.frame.size.height))
        btn.backgroundColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
        btn.tintColor = UIColor.white
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(onClickHeader), for: .touchUpInside)
        return btn
    }()

    @objc func onClickHeader(){
        delegate.selectedHeader(index: self.tag)
    }
}
