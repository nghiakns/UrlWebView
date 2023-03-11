//
//  ModelSevices.swift
//  WebView
//
//  Created by Macbook Pro on 09/03/2023.
//

import Foundation

class ModelSevices {
    func getTask() throws -> [ModelsUrl]{
        guard let tasks = UserDefaults.standard.data(forKey: "UrlKey") else {
            return []
        }
        return try JSONDecoder.init().decode([ModelsUrl].self, from: tasks)
    }
    
    func saveTask(task: ModelsUrl) throws {
        var tasks = try getTask()
        tasks.append(task)
        
        let data = try JSONEncoder().encode(tasks)
        UserDefaults.standard.set(data, forKey: "UrlKey")
    }
    
    func removeTask(task: ModelsUrl, index: Int) throws {
        var tasks = try getTask()
        tasks.remove(at: index)
        let data = try JSONEncoder().encode(tasks)
        UserDefaults.standard.set(data, forKey: "UrlKey")
    }
}
