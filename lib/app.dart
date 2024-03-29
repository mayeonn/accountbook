import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

class AccountBookApp extends StatefulWidget {
  const AccountBookApp({Key? key}) : super(key: key);

  @override
  _AccountBookAppState createState() => _AccountBookAppState();
}

class _AccountBookAppState extends State<AccountBookApp>{
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'AccountBookApp',
            theme: ThemeData(
              primaryTextTheme: const TextTheme(
                title: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),


              primaryIconTheme: const IconThemeData(
                color: Colors.white,
              ),

              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0XFF139e5d)
                )
              ),
              appBarTheme: AppBarTheme(
                color: const Color(0xFF88c2a7),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                )
              ),
              primaryColor:  const Color(0xFF88c2a7),
              colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0XFF36d189)),
            ),
            home: const HomePage(),
            initialRoute: '/login',
            onGenerateRoute: _getRoute,
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container();
      },
    );
  }

  Route<dynamic>? _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => const LoginPage(),
      fullscreenDialog: true,
    );
  }

}