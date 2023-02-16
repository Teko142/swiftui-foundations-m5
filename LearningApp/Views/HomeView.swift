//
//  ContentView.swift
//  LearningApp
//
//  Created by Артур Олехно on 11/01/2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        NavigationView{
            VStack (alignment: .leading) {
                Text("What do you want to do today?")
                    .padding(.leading, 20)
                
                ScrollView {
                    
                    LazyVStack{
                        
                        ForEach(model.modules) { module in
                            
                            NavigationLink(destination:
                                            ContentView()
                                .onAppear(perform: {
                                    model.beginModule(module.id)
                                }),
                                           tag: module.id,
                                           selection: $model.currentContentSelected,
                                           label: {
                                
                                HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                
                            })
                            
                            
                            
                            HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Lessons", time: module.test.time)
                            
                        }
                    }
                    .accentColor(.black)
                    .padding()
                }
            }
            .navigationTitle("Get Started")
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
