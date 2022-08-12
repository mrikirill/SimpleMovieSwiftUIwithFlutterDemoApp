//
//  FlowCoordinator.swift
//  SimpleMovie
//
//  Created by Kirill Glushchenko on 9/8/2022.
//

import SwiftUI
import UIKit
import Flutter

final class FlowCoordinator: ObservableObject {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func showRootView() {
        let swiftUIView = PopularMovies(viewModel: .init())
            .environmentObject(self)
        let hostingView = UIHostingController(rootView: swiftUIView)
        window.rootViewController = UINavigationController(rootViewController: hostingView)
    }
    
    func showDetailMovieFlutter(movieId: Int, title: String) {
        let flutterViewController = FlutterViewController(
              project: nil, initialRoute: "/detail?movieId=\(movieId)&title=\(title)", nibName: nil, bundle: nil)
        let navigationController = window.rootViewController as? UINavigationController
        navigationController?.pushViewController(flutterViewController, animated: true)
    }
}
