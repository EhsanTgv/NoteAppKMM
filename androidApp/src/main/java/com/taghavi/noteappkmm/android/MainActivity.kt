package com.taghavi.noteappkmm.android

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.navigation.NavType
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import androidx.navigation.navArgument
import com.taghavi.noteappkmm.android.note_details.NoteDetailsScreen
import com.taghavi.noteappkmm.android.note_list.NoteListScreen
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            val navController = rememberNavController()
            NavHost(navController = navController, startDestination = "note_list") {
                composable(route = "note_list") {
                    NoteListScreen(navController = navController)
                }
                composable(
                    route = "note_detail/{noteId}",
                    arguments = listOf(
                        navArgument(name = "noteId") {
                            type = NavType.LongType
                            defaultValue = -1L
                        }
                    )
                ) { backStackEntry ->
                    val noteId = backStackEntry.arguments?.getLong("noteId") ?: -1L
                    NoteDetailsScreen(noteId = noteId, navController = navController)
                }
            }
        }
    }
}
