// main.dart
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_discovery/app/app.dart';
import 'di/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  await di.init();

  runApp(const MyApp());
}
