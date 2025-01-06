//
//  UIButton + Extension.swift
//  LoginApp
//
//  Created by Gabriel Fontenele da Silva on 01/01/25.
//

import Foundation
import UIKit

extension UIButton {
    
    func setShadowButton(button: UIButton){
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 8
        layer.shouldRasterize = true
        layer.masksToBounds = false
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    func createButton(title: String,
                      backgroundColor: UIColor = .systemFill,
                      titleColor: UIColor = .black,
                      cornerRadius: CGFloat = 7.5,
                      ofsize: CGFloat = 16,
                      uiFonte: UIFont.Weight = .regular,
                      icon: UIImage? = nil,
                      iconSize: CGSize = CGSize(width: 25, height: 25),
                      imageEdgeInsets: UIEdgeInsets = UIEdgeInsets(top: 5, left: -10, bottom: 5, right: 0)) -> UIButton {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.layer.cornerRadius = cornerRadius
        button.backgroundColor = backgroundColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: ofsize, weight: uiFonte)
        
        // Se o ícone for fornecido, adiciona o ícone ao botão
        if let iconImage = icon {
            let resizedImage = UIGraphicsImageRenderer(size: iconSize).image { _ in
                iconImage.draw(in: CGRect(origin: .zero, size: iconSize))
            }
            button.setImage(resizedImage, for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.imageEdgeInsets = imageEdgeInsets
        }
        
        return button
    }
//

}
