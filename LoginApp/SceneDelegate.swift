//
//  SceneDelegate.swift
//  LoginApp
//
//  Created by Gabriel Fontenele da Silva on 01/01/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // Verifica se a cena pode ser convertida para UIWindowScene, caso contrário, retorna sem fazer nada.
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Cria a janela principal associada à cena.
        let window = UIWindow(windowScene: windowScene)
        
        // Instancia o ViewController principal.
        let vc = LoginViewController()
        
        // Cria um UINavigationController com o ViewController como tela raiz.
        let navVC = UINavigationController(rootViewController: vc)
        
        // Define o UINavigationController como o controlador raiz da janela.
        window.rootViewController = navVC
        
        // Torna a janela a principal do aplicativo e a torna visível.
        window.makeKeyAndVisible()
        
        // Armazena a janela criada na propriedade da classe para mantê-la em memória.
        self.window = window
    }


    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

