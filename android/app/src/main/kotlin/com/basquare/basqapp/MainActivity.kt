package com.basquare.basqapp

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {


//    override fun onCreate(savedInstanceState: Bundle?) {
//        FlutterMain.startInitialization(this); //Added line
//        super.onCreate(savedInstanceState)
//        GeneratedPluginRegistrant.registerWith(this)
//    }
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }
}
