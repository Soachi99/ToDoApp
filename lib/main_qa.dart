import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:todoapp/src/app.dart';

Future<void> main() async {
  await Firebase.initializeApp();

  FlavorConfig(
    name: "QA",
    variables: {},
  );

  runApp(const ProviderScope(child: App()));
}
