//
//  NoteListScreen.swift
//  iosApp
//
//  Created by Ehsan Taghavi on 9/12/23.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI
import shared

struct NoteListScreen: View {
    private var noteDataSource: NoteDataSource
    @StateObject var viewModel = NoteListViewModel(noteDataSource: nil)
    
    @State private var isNoteSelected = false
    @State private var selectedNoteId: Int64? = nil
    
    init(noteDataSource: NoteDataSource) {
        self.noteDataSource = noteDataSource
    }
    
    var body: some View {
        VStack {
            ZStack{
                NavigationLink(destination: NoteDetailScreen(noteDataSource: self.noteDataSource,noteId:selectedNoteId), isActive: $isNoteSelected){
                    EmptyView()
                }.hidden()
                HideableSearchTextField<NoteDetailScreen>(onSearchToggled: {
                    viewModel.toggleIsSearchActive()
                }, destinationProvider: {
                    NoteDetailScreen(
                        noteDataSource: noteDataSource,
                        noteId: selectedNoteId
                    )
                }, isSearchActive: viewModel.isSearchActive, searchText: $viewModel.searchText)
                .frame(maxWidth:.infinity, minHeight:40)
                .padding()
                
                if !viewModel.isSearchActive{
                    Text("All notes")
                        .font(.title2)
                }
            }
            
            if #available(iOS 15.0, *) {
                List {
                    ForEach(viewModel.filteredNotes, id: \.self.id) {note in
                        Button(action: {
                            isNoteSelected = true
                            selectedNoteId = note.id?.int64Value
                        }){
                            NoteItem(note:note,onDeleteClick: {
                                viewModel.deleteNoteById(id: note.id?.int64Value)
                            })
                        }
                    }
                }
                .onAppear{
                    viewModel.loadNotes()
                }
                .listStyle(.plain)
                .listRowSeparator(.hidden)
            } else {
                // Fallback on earlier versions
            }
        }.onAppear{
            viewModel.setNoteDataSource(noteDataSource: noteDataSource)
        }
    }
}

struct NoteListScreen_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
