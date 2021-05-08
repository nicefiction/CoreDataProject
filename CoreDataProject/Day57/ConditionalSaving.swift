// MARK: ConditionalSaving.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/conditional-saving-of-nsmanagedobjectcontext
 
 Apple specifically states
 that we should always check for uncommitted changes
 before calling `save()` ,
 to avoid making Core Data do work that isn’t required .
 */

import SwiftUI



struct ConditionalSaving: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        Button("Save") {
            /**
             Fortunately , we can check for changes in two ways .
             (`1`) First , every managed object is given a `hasChanges` property ,
             that is `true` when the object has unsaved changes .
             And , (`2`) the entire context also contains a `hasChanges` property
             that checks whether any object owned by the context has changes .
             */
            if managedObjectContext.hasChanges {
                try? self.managedObjectContext.save()
            }
        }
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct ConditionalSaving_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ConditionalSaving()
    }
}
