
import 'package:flutter/material.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool cacherMotDePasse = true;

  final Color vert = const Color(0xFF16866A);
  final Color fond = const Color(0xFFF4F8F6);
  final Color texte = const Color(0xFF20352F);

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 12,
            ),

            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  // En-tête
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Color(0xFF20352F),
                        ),
                      ),

                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: 'Flutter',
                              style: TextStyle(color: texte),
                            ),
                            TextSpan(
                              text: 'Learn',
                              style: TextStyle(color: vert),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 35),

                  // Icône de connexion
                  Container(
                    width: 48,
                    height: 48,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F4F0),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Icon(
                      Icons.login,
                      color: vert,
                      size: 25,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Titre
                  Text(
                    'Heureux de vous revoir.',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: texte,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Connectez-vous pour reprendre votre '
                    'apprentissage là où vous l’avez laissé.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Adresse e-mail
                  const Text(
                    'Adresse e-mail',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF20352F),
                    ),
                  ),

                  const SizedBox(height: 9),

                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'exemple@domaine.fr',
                      hintStyle: const TextStyle(
                        fontSize: 13,
                        color: Colors.black45,
                      ),
                      prefixIcon: const Icon(
                        Icons.mail_outline,
                        size: 19,
                        color: Colors.blueGrey,
                      ),
                      filled: true,
                      fillColor: fond,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 17,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                          color: Color(0xFFE3EBE7),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                          color: vert,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 19),

                  // Mot de passe
                  const Text(
                    'Mot de passe',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF20352F),
                    ),
                  ),

                  const SizedBox(height: 9),

                  TextField(
                    controller: passwordController,
                    obscureText: cacherMotDePasse,
                    decoration: InputDecoration(
                      hintText: 'Saisissez votre mot de passe',
                      hintStyle: const TextStyle(
                        fontSize: 13,
                        color: Colors.black45,
                      ),
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        size: 19,
                        color: Colors.blueGrey,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          cacherMotDePasse
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 19,
                          color: Colors.blueGrey,
                        ),
                        onPressed: () {
                          setState(() {
                            cacherMotDePasse = !cacherMotDePasse;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: fond,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 17,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                          color: Color(0xFFE3EBE7),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                          color: vert,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),

                  // Mot de passe oublié
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Fonctionnalité bientôt disponible.',
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Mot de passe oublié ?',
                        style: TextStyle(
                          color: vert,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 13),

                  // Bouton connexion
                  SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        if (emailController.text.trim().isEmpty ||
                            passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Veuillez remplir tous les champs.',
                              ),
                            ),
                          );
                          return;
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'La connexion sera activée avec Firebase.',
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: vert,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Se connecter',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward, size: 18),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Inscription
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Flexible(
                        child: Text(
                          'Nouveau sur FlutterLearn ? ',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupPage(),
                            ),
                          );
                        },
                        child: Text(
                          'S’inscrire',
                          style: TextStyle(
                            fontSize: 12,
                            color: vert,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 90),

                  // Confidentialité
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shield_outlined,
                        size: 15,
                        color: Colors.blueGrey,
                      ),
                      SizedBox(width: 7),
                      Text(
                        'Vos données restent confidentielles.',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
