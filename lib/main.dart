import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/app.dart';
import 'package:gapopa_flutter_vedant/bindings/app_bindings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializePreRunControllers();
  runApp(const MyApp());
}
