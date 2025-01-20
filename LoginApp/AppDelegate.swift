//
//  AppDelegate.swift
//  LoginApp
//
//  Created by Gabriel Fontenele da Silva on 01/01/25.
//

import UIKit
import Firebase
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // Inicializa o Firebase quando o aplicativo é iniciado
    var signInConfig: GIDConfiguration?

    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Configurar Firebase
        FirebaseApp.configure()
        
        // Configurar Google Sign-In com GIDConfiguration
        if let clientID = FirebaseApp.app()?.options.clientID {
            signInConfig = GIDConfiguration(clientID: clientID)
        } else {
            print("Erro: Não foi possível obter o clientID do Firebase.")
        }
        return true
    }
    
    // Gerencia o ciclo de vida de sessões de cena (iOS 13+)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Libere recursos específicos de cenas descartadas, se necessário.
    }
    
    // Gerencia o retorno de URLs para autenticação do Google
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return ((GIDSignIn.sharedInstance.handle(url)) != nil)
    }
}

