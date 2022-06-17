//
//  SceneDelegate.swift
//  StudyTimer
//
//  Created by 장재훈 on 2022/06/07.
//

import FirebaseAuth
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // 사용자 로그인 여부 확인
        var mainStoryboard: UIStoryboard?
        var protectedPage: UIViewController?

        if Auth.auth().currentUser != nil {
            mainStoryboard = UIStoryboard(name: HomeViewController.storyboard, bundle: nil)
            protectedPage = mainStoryboard!.instantiateViewController(withIdentifier: HomeViewController.identifier) as! HomeViewController
        } else {
            mainStoryboard = UIStoryboard(name: SignInViewController.storyboard, bundle: nil)
            protectedPage = mainStoryboard!.instantiateViewController(withIdentifier: SignInViewController.identifier) as! SignInViewController
        }
        window!.rootViewController = protectedPage
        window!.makeKeyAndVisible()

        guard let _ = (scene as? UIWindowScene) else { return }
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
