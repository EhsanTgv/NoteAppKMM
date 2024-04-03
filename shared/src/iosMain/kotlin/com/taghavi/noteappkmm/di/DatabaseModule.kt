package com.taghavi.noteappkmm.di

import com.taghavi.noteappkmm.data.local.DatabaseDriverFactory
import com.taghavi.noteappkmm.data.note.SqlDelightNoteDataSource
import com.taghavi.noteappkmm.database.NoteDatabase
import com.taghavi.noteappkmm.domain.note.NoteDataSource

class DatabaseModule {

    private val factory by lazy { DatabaseDriverFactory() }
    val noteDataSource: NoteDataSource by lazy {
        SqlDelightNoteDataSource(NoteDatabase(factory.createDriver()))
    }
}