import Foundation
import CoreData

class LocalData {
    static let shared = LocalData(managedObjectContext: NSManagedObjectContext.current)
    var managedObjectContext: NSManagedObjectContext

    private init(managedObjectContext: NSManagedObjectContext){
        self.managedObjectContext = managedObjectContext
    }

    func addFavoriteGame(favoriteGame: Favorite) throws {
        self.managedObjectContext.insert(favoriteGame)
        try self.managedObjectContext.save()
    }

    func deleteFavorite(gameId: Int32) throws {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorite")
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "gameId == \(gameId)")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        batchDeleteRequest.resultType = .resultTypeCount
        do {
            try self.managedObjectContext.execute(batchDeleteRequest)
        } catch let error as NSError {
            print(error)
        }
    }

    func getAllFavorite() -> [Favorite] {

        var favorite = [Favorite]()
        let postRequest: NSFetchRequest<Favorite> = Favorite.fetchRequest()

        do {
            favorite = try self.managedObjectContext.fetch(postRequest)
        } catch let error as NSError {
            print(error)
        }

        return favorite
    }
    
    func getFavoriteById(_ gameId: Int32, completion: @escaping(FavoriteGameModel?) -> ()) {
            
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favorite")
            fetchRequest.fetchLimit = 1
            fetchRequest.predicate = NSPredicate(format: "gameId == \(gameId)")
            print(fetchRequest)
            do {
                if let result = try self.managedObjectContext.fetch(fetchRequest).first{
                    let favorite = FavoriteGameModel(
                        gameId: result.value(forKeyPath: "gameId") as? Int32,
                        gameName: result.value(forKeyPath: "gameName") as? String,
                        gameRelease: result.value(forKeyPath: "gameRelease") as? String,
                        gameBackgroundImage: result.value(forKeyPath: "gameBackgroundImage") as? String,
                        gameRating: result.value(forKeyPath: "gameRating") as? Float,
                        gameDescription: result.value(forKey: "gameDescription") as? String)
                    DispatchQueue.main.async {
                        
                        completion(favorite)
                    }
                    
                }
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }


}
