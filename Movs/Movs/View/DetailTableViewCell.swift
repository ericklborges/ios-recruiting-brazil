//
//  DetailTableViewCell.swift
//  Movs
//
//  Created by Erick Lozano Borges on 19/11/18.
//  Copyright © 2018 Erick Lozano Borges. All rights reserved.
//

import UIKit
import Reusable

class DetailTableViewCell: UITableViewCell, Reusable {

    //MAR: - Interface
    lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = Style.colors.dark
        label.backgroundColor = Style.colors.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var favouriteButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.imageView?.contentMode = .scaleToFill
        button.setImage(UIImage(named: "favorite_full_icon")!, for: .normal)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var separator: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = Style.colors.dark
        return view
    }()
    
    fileprivate var hasButton: Bool = false
    fileprivate var hasSeparator: Bool = true
    
    func setup(withText text: String, withButton: Bool = false, withSeparator: Bool) {
        label.text = text
        hasButton = withButton
        hasSeparator = withSeparator
        setupView()
    }
    
    var tapped = false
    
    @objc
    func handleTap() {
        tapped = !tapped
        if tapped == false {
            favouriteButton.setImage(UIImage(named: "favorite_full_icon")!, for: .normal)
        } else {
            favouriteButton.setImage(UIImage(named: "favorite_empty_icon")!, for: .normal)
        }
        
    }
}

extension DetailTableViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(label)
        if hasButton {
            contentView.addSubview(favouriteButton)
        }
        if hasSeparator {
            contentView.addSubview(separator)
        }
    }
    
    func setupConstraints() {
        label.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
            if hasButton {
                make.width.equalToSuperview().inset(40)
            } else {
                make.right.equalToSuperview().inset(20)
            }
        }
        
        if hasButton {
            favouriteButton.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalTo(label.snp.right).offset(5)
                make.right.equalToSuperview().inset(20)
                make.height.equalTo(favouriteButton.snp.width)
            }
        }
        
        if hasSeparator {
            separator.snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(20)
                make.right.equalToSuperview()
                make.bottom.equalToSuperview()
                make.height.equalTo(0.5)
            }
        }
        
    }
}