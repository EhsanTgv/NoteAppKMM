package com.taghavi.noteappkmm

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform