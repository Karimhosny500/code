import 'package:final_skate/common/theme.dart';

import 'package:final_skate/controllers/auth_provider.dart';

import 'package:final_skate/router/routes_name.dart';
import 'package:final_skate/router/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Flurorouter.setupRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ],
        builder: (context, builder) {
          return MaterialApp(
            title: 'Skate',
            theme: ThemeData(
                primaryColor: primaryColor,
                scaffoldBackgroundColor: scaffoldBackgroundColor,
                textTheme: const TextTheme(
                    titleMedium: TextStyle(color: primaryColor))),
            debugShowCheckedModeBanner: false,
            initialRoute: RoutesName.splash,
            onGenerateRoute: Flurorouter.router.generator,
          );
        });
  }
}
