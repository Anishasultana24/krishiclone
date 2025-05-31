import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home.dart';
import 'disease_detection.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 174, 213, 84),
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF104A3B),
                  Color(0xFF165920),
                  Color(0xFF9DC567),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Top Row
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "KRISHI\nRAKSHAK",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Sign In"),
                  ),
                ],
              ),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.only(top: 180, left: 24, right: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 16),

                // Email Input
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 4, bottom: 8),
                      child: Text(
                        "Email",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined),
                        hintText: "olivia@untitledui.com",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),
                const Text("or login with",
                    style: TextStyle(color: Colors.white70)),

                const SizedBox(height: 8),

                // Phone Input
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 4, bottom: 8),
                      child: Text(
                        "Phone number",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: '+91',
                              isExpanded: true,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              items: const [
                                DropdownMenuItem(
                                    value: '+91', child: Text('🇮🇳 +91')),
                                DropdownMenuItem(
                                    value: '+1', child: Text('🇺🇸 +1')),
                                DropdownMenuItem(
                                    value: '+44', child: Text('🇬🇧 +44')),
                              ],
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "000-000-0000",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                const Text(
                  "This is a hint text to help user.",
                  style: TextStyle(fontSize: 12, color: Colors.white70),
                ),

                const SizedBox(height: 8),
                const Text("or sign up with",
                    style: TextStyle(color: Colors.white70)),

                const SizedBox(height: 8),

                // Social Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    socialButton("Google", context),
                    const SizedBox(width: 8),
                    socialButton("Apple", context),
                    const SizedBox(width: 8),
                    socialButton("Email", context),
                  ],
                ),

                const SizedBox(height: 12),

                // Bottom text
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: "Don't have an Account? ",
                      style: TextStyle(color: Colors.white70),
                      children: [
                        TextSpan(
                          text: "Sign up here",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom Plant Image
          Positioned(
            bottom: -5, // lowered ellipse shape
            left: 0,
            right: 0,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 200,
                  width: 700,
                  decoration: const BoxDecoration(
                    color: Color(0xFF0B3A2B),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.elliptical(400, 200),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Image.asset(
                    'assets/images/capsul.png',
                    height: 320,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget socialButton(String text, BuildContext context) {
    IconData icon;
    switch (text) {
      case "Google":
        icon = Icons.g_mobiledata;
        break;
      case "Apple":
        icon = Icons.apple;
        break;
      case "Email":
        icon = Icons.email;
        break;
      default:
        icon = Icons.link;
    }

    return ElevatedButton(
      onPressed: () async {
        bool isLogged = await login();

        if (isLogged) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DiseaseDetectionPage(),
              ));
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.black, size: 20),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Future<bool> login() async {
    try {
      print('Starting Google Sign-In process');
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      if (gUser == null) {
        print('Google Sign-In aborted by user');
        return false;
      }

      print('Got Google user: ${gUser.email}');
      final GoogleSignInAuthentication gAuth = await gUser.authentication;
      print('Got Google authentication');

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      print('Attempting Firebase sign in');
      await FirebaseAuth.instance.signInWithCredential(credential);
      print('Firebase sign in successful');

      return true;
    } catch (e, stackTrace) {
      print('Sign-in error: $e');
      print('Stack trace: $stackTrace');
      return false;
    }
  }
}
