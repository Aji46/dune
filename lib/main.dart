import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'screens/main_shell.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DuneWomenApp());
}

class DuneWomenApp extends StatelessWidget {
  const DuneWomenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DUNE Women — Surplus Dress Boutique',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const MainShell(),
    );
  }
}
