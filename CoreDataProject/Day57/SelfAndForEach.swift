// MARK: SelfAndForEach.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/why-does-self-work-for-foreach
 
 If an object conforms to the `Identifiable` protocol ,
 then SwiftUI will automatically use its `id` property for uniquing .
 If we don’t use `Identifiable` ,
 then we can use a `keypath` for a property we know to be unique ,
 such as a book’s ISBN number .
 But if we don’t conform to `Identifiable`
 and don’t have a `keypath` that is unique ,
 we can often use` \.self` .
 When we use `\.self` as an identifier ,
 we mean “the whole object” ,
 but in practice that doesn’t mean much
 — a struct is a struct ,
 so it doesn’t have any sort of specific identifying information
 other than its contents .
 So what actually happens is
 that Swift computes the hash value of the struct ,
 which is a way of representing complex data in fixed-size values ,
 then uses that hash as an identifier .
 Hashes are commonly used for things like data verification .
 Hashes are also used with dictionary keys and sets ;
 that is how they get their fast look up .
 With `Core Data` we used `\.self`
 for the _managed object class_ that Xcode generated for us .
    `Hashable` is a bit like `Codable` :
 if we want to make a custom type conform to `Hashable` ,
 then as long as everything it contains also conforms to `Hashable`
 then we don’t need to do any work .
 
 Now , you might think this leads to a problem :
 if we create two Core Data objects with the same values ,
 they’ll generate the same hash, and we’ll hit animation problems .
 However , Core Data does something really smart here :
 the objects it creates for us actually have a selection of other properties
 beyond those we defined in our data model ,
 including one called the `object ID`
 — an identifier that is unique to that object ,
 regardless of what properties it contains .
 These IDs are similar to UUID ,
 although Core Data generates them sequentially as we create objects .
 
 `WARNING` :
 Although calculating the same hash for an object twice in a row
 should return the same value ,
 calculating it between two runs of your app
 — i.e., calculating the hash ,
 quitting the app ,
 relaunching ,
 then calculating the hash again —
 can return different values .
 */

import SwiftUI



struct Student: Hashable {
    
    var name: String
}



struct SelfAndForEach: View {
    
     // /////////////////
    //  MARK: PROPERTIES
    
    let students: [Student] = [
        Student(name : "Dorothy Gale") ,
        Student(name : "Glinda of Oz") ,
        Student(name : "Ozma of Oz")
    ]
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        List {
            ForEach(students , id : \.self) { (student: Student) in
                Text(student.name)
                    .font(.title)
                    .padding()
            }
        }
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct SelfAndForEach_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SelfAndForEach()
    }
}
