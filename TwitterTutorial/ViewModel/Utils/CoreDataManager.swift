//
//  CoreDataManager.swift
//  ios-trainning
//
//  Created by justin on 2022/12/6.
//

import Foundation


import Foundation
import CoreData

class CoreDataManager {

    let persistentContainer: NSPersistentContainer

    init() {
        persistentContainer = NSPersistentContainer(name: "Model")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data Sotre failed to initialize \(error.localizedDescription)")
            }
        }
    }

    func getAllMovies() -> [Movie] {
        let fetchReqeust: NSFetchRequest<Movie> = Movie.fetchRequest()

        do {
            return try persistentContainer.viewContext.fetch(fetchReqeust)
        } catch {
            return []
        }
    }

    func saveMove(title: String) {
        let movie = Movie(context: persistentContainer.viewContext)

        movie.title = title

        do {
            try persistentContainer.viewContext.save()
            print("Movie saved!")
        } catch {
            print("Failed to save movie \(error)")
        }

    }

}
