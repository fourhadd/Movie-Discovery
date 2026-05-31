// main.dart
import 'package:flutter/material.dart';
import 'package:movie_discovery/app/app.dart';
import 'package:movie_discovery/di/injection.dart' as GetStorage;
import 'di/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await di.init();

  runApp(const MyApp());
}
