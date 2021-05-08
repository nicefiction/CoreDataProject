// MARK: Movie+CoreDataProperties.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/creating-nsmanagedobject-subclasses
 */

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

     // @NSManaged public var title: String?
     @NSManaged public var title: String
     // @NSManaged public var director: String?
     @NSManaged public var director: String
    /**
     That will absolutely work .
     You can make Movie objects with just the same code as before ,
     use fetch requests to query them ,
     save their managed object contexts ,
     and more ,
     all with no problems .
     However ,
     you might notice something strange :
     even though our properties aren’t optional any more ,
     it’s still possible to create an instance of the Movie class
     without providing those values .
     This ought to be impossible :
     these properties aren’t optional ,
     which means they must have values all the time ,
     and yet we can create them without values . (...)
     */
    
    @NSManaged public var year: Int16

    /**
     (...) Instead , you might want to consider adding computed properties
     that help us access the optional values safely ,
     while also letting us store your nil coalescing code all in one place .
     For example , adding this as a property on Movie
     ensures that we always have a valid title string to work with :
     */
    public var wrappedTitle: String {
        
        title ?? "Unknown Title"
    }
    /**
     This way
     the whole rest of your code doesn’t have to worry about Core Data’s optionality ,
     and if you want to make changes to default values
     you can do it in a single file .
     */
}





extension Movie : Identifiable {

}
