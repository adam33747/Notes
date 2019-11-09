//
//  Note.swift
//  Notes
//
//  Created by Adam Hu on 11/9/19.
//  Copyright © 2019 Adam Hu. All rights reserved.
//

import Foundation
import CoreData

public class Note:NSManagedObject, Identifiable{
    @NSManaged public var createdAt:Date?
    @NSManaged public var title:String?
}

extension Note {
    static func getAllNotes() -> NSFetchRequest<Note> {
        let request:NSFetchRequest<Note> = Note.fetchRequest() as! NSFetchRequest<Note>
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
