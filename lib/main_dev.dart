import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:todoapp/src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyBiueWq8sc13nUmubAy_zU0yll_ob3jMf4",
              appId: "1:366491493610:android:a53cba7d06b8b0c622a393",
              messagingSenderId: "366491493610",
              projectId: "todoapp-d2e0a"))
      : await Firebase.initializeApp();

  FlavorConfig(
    name: "DEV",
    variables: {},
  );

  runApp(const ProviderScope(child: App()));
}
