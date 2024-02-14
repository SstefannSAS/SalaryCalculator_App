import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Import Firebase Auth
import 'package:my_app/features/app/splash_screen/splash_screen.dart';
import 'package:my_app/features/user_auth/presentation/pages/homepage/home_page.dart';
import 'package:my_app/features/user_auth/presentation/pages/authentification/login_page.dart';
import 'package:my_app/features/user_auth/presentation/pages/authentification/sign_up_page.dart';
import 'package:my_app/features/user_auth/presentation/pages/settings/settings_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCwk3irg5lgdEa207RaqA8RquYWVfufQ-I",
        appId: "1:74536732333:android:681e82e8939925eb45a824",
        messagingSenderId: "74536732333",
        projectId: "myapp-b61a0",
        // Your web Firebase config options
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salary Manager',
      routes: {
        '/': (context) => const SplashScreen(
              // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
              child: LoginPage(),
            ),
        '/login': (context) => const LoginPage(),
        '/signUp': (context) => const SignUpPage(),
        '/homepage': (context) => const HomePage(),
        '/settingspage': (context) => const Settingspage(),
      },
    );
  }
}
