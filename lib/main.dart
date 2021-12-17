import 'package:flutter/services.dart';
import './provider/settings.dart';
import './screens/home_screen.dart';
import './screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'themes.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //loading Previous Settings
  await SettingsManager.getPreviousSettings();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) {
    runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SettingsManager())],
      child: const MyApp(),
    ));
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mo Weather',
        theme: Themes.getTheme(Provider.of<SettingsManager>(context).themeMode),
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          SettingsScreen.routeName: (context) => const SettingsScreen(),
        },
        home: const HomeScreen());
  }
}
