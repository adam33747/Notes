//
//  ContentView.swift
//  Notes
//
//  Created by Adam Hu on 11/9/19.
//  Copyright © 2019 Adam Hu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Note.getAllNotes()) var notes:FetchedResults<Note>
    
    @State private var newNote = ""
    
    var body: some View {
       
        NavigationView{
            List {
                Section(header: Text("New Note")){
                    HStack{
                        TextField("Enter a note here", text: self.$newNote)
                        
                        Button(action:{
                            let note = Note(context: self.managedObjectContext)
                            note.title = self.newNote
                            note.createdAt = Date()
                            
                            do {
                                try self.managedObjectContext.save()
                            }catch{
                                print(error)
                            }
                            
                            self.newNote = ""
                            
                        }){
                            Image(systemName: "plus.circle.fill")
                            .foregroundColor(.green)
                            .imageScale(.large)
                        }.disabled(newNote.isEmpty)
                        
                    }
                }.font(.headline)
                
                Section(header: Text("Notes")) {
                    ForEach(self.notes) {note in
                        NoteView(title: note.title!, createdAt: "\(note.createdAt!)")
                    }.onDelete {indexSet in
                        let deleteItem = self.notes[indexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        
                        do{
                            try self.managedObjectContext.save()
                        }catch{
                            print(error)
                        }
                    }
                    
                }
            }
            .navigationBarTitle(Text("Notes"))
                .navigationBarItems(trailing: EditButton())
            
        }
        

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(title: "My great to do list", createdAt: "today")
    }
}
