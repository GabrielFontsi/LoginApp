//
//  HomeViewController.swift
//  LoginApp
//
//  Created by Gabriel Fontenele da Silva on 20/01/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var homeScren = HomeScreen()
    
    override func loadView() {
        self.view = self.homeScren
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray2
        self.navigationItem.hidesBackButton = true
    }


}
