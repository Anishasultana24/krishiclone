import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'pages/home.dart';
import 'pages/signin.dart';
import 'pages/signup.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    print('Flutter binding initialized');

    if (kIsWeb) {
      // Web configuration
      await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCvqg20xCrNARG-oh4KWQUIoutX1RSOS6I",
            authDomain: "authentication-krishirak-21f4a.firebaseapp.com",
            projectId: "authentication-krishirak-21f4a",
            storageBucket: "authentication-krishirak-21f4a.firebasestorage.app",
            messagingSenderId: "384269929590",
            appId: "1:384269929590:web:1:384269929590:android:8ff7131f27362141c8e357"),
      );
    } else {
      // Android configuration
      await Firebase.initializeApp();
    }
    print('Firebase initialized successfully');

    runApp(const MyApp());
  } catch (e) {
    print('Error during initialization: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('Building MyApp');
    return MaterialApp(
      title: 'Krishi Rakshak',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF104A3B)),
        useMaterial3: true,
      ),
      // Remove initialRoute and use home instead
      home: const AuthWrapper(), // this decides whether to show SignIn or Home
      routes: {
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    print('Building AuthWrapper');
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(), // listen to login state
      builder: (context, snapshot) {
        print('Auth state changed: ${snapshot.connectionState}');
        if (snapshot.hasError) {
          print('Auth error: ${snapshot.error}');
          return const Scaffold(
            body:
                Center(child: Text('Error occurred. Please restart the app.')),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData) {
          print('User is logged in: ${snapshot.data?.email}');
          return const HomePage(); // user is logged in
        } else {
          print('User is not logged in');
          return const SignInPage(); // not logged in
        }
      },
    );
  }
}
