import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'services/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.instance.init();
  runApp(const ProviderScope(child: KeepsApp()));
}

class KeepsApp extends StatelessWidget {
  const KeepsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keeps',
      debugShowCheckedModeBanner: false,
      theme: buildKeepsTheme(),
      home: const HomeScreen(),
    );
  }
}