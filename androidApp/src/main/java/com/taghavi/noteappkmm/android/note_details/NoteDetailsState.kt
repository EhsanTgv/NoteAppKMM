package com.taghavi.noteappkmm.android.note_details

import androidx.compose.ui.graphics.Color

data class NoteDetailsState(
    val noteTitle: String = "",
    val isNoteTitleHintVisible: Boolean = false,
    val noteContent: String = "",
    val isNoteContentHintVisible: Boolean = false,
    val noteColor: Long = 0xFFFFFF,
)
