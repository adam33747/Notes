//
//  NoteView.swift
//  Notes
//
//  Created by Adam Hu on 11/9/19.
//  Copyright © 2019 Adam Hu. All rights reserved.
//

import SwiftUI

struct NoteView: View {
    var title:String = ""
    var createdAt:String = ""
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(title)
                    .font(.headline)
                Text(createdAt)
                    .font(.caption)
            }
        }
        
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
