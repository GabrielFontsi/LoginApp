//
//  TextField + Extension.swift
//  LoginApp
//
//  Created by Gabriel Fontenele da Silva on 01/01/25.
//

import Foundation
import UIKit

extension UITextField {
    
    func setTextFieldShadow(textField: UITextField){
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 8
        layer.shouldRasterize = true
        layer.masksToBounds = false
        layer.rasterizationScale = UIScreen.main.scale
    }
}

class IconTextField: UITextField {
    
    let iconImageView: UIImageView = {
           let imageView = UIImageView()
           imageView.contentMode = .center // Ajuste o content mode conforme necessário
           return imageView
       }()
    
    init(icon: UIImage?) {
           super.init(frame: .zero)
           setupIcon(icon: icon)
       }

       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           setupIcon(icon: nil)
       }

    private func setupIcon(icon: UIImage?) {
          if let iconImage = icon {
              iconImageView.image = iconImage
          }
          iconImageView.tintColor = .lightGray // Ajuste a cor do ícone conforme necessário
          iconImageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20) // Ajuste o tamanho do ícone conforme necessário
          leftView = iconImageView
          leftViewMode = .always // Garante que o ícone esteja sempre visível à esquerda
      }

      override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
          var rect = super.leftViewRect(forBounds: bounds)
          rect.origin.x += 10 // Ajuste a posição do ícone conforme necessário
          return rect
      }
}
