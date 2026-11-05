
import 'package:flutter/material.dart';
import '../auth/login_page.dart';
import '../auth/signup_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final Color vert = const Color(0xFF16866A);
  final Color fond = const Color(0xFFF5F8F7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1522202176988-66273c2fd55f',
            fit: BoxFit.cover,
          ),

          Container(
            color: const Color(0xFF20352F).withOpacity(0.70),
          ),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.school_rounded,
                      size: 75,
                      color: Colors.white,
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      'Bienvenue sur\nFlutterLearn',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Apprenez à votre rythme et développez '
                      'vos compétences dans le monde de la programmation.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 45),

                    // Bouton inscription
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SignupPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: vert,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Commencer',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    // Bouton connexion
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Vous avez déjà un compte ? ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const LoginPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Se connecter',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
