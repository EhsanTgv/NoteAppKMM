//
//  NoteItem.swift
//  iosApp
//
//  Created by Ehsan Taghavi on 20.12.2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI
import shared

struct NoteItem: View {
    var note:Note
    var onDeleteClick: () -> Void
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(note.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
                Button(action:onDeleteClick){
                    Image(systemName: "xmark").foregroundColor(.black)
                }
            }.padding(.bottom,3)
            
            Text(note.content)
                .fontWeight(.light)
                .padding(.bottom,3)
            
            HStack{
                Spacer()
                Text(DateTimeUtil().formatNoteDate(dateTime: note.created))
                    .font(.footnote)
                    .fontWeight(.light)
            }
        }
        .padding()
        .background(Color(hex: note.colorHex ))
        .clipShape(RoundedRectangle(cornerRadius: 5.0))
    }
}

struct NoteList_Previews: PreviewProvider {
    static var previews: some View {
        NoteItem(note: Note(id: nil, title: "My note", content: "Note content", colorHex: 0xFF2341, created: DateTimeUtil().now()), onDeleteClick: {})
    }
}
