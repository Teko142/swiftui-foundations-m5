//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Артур Олехно on 11/01/2023.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
