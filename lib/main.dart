import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'internal/application.dart';
import 'internal/dependencies/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark
  ));

  await initializeDependencies();
  runApp(MyApp());
}

