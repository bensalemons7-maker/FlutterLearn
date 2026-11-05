
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nomController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String role = 'Apprenant';
  bool cacherMotDePasse = true;

  final Color vert = const Color(0xFF16866A);

  @override
  void dispose() {
    nomController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F8F7),
        title: Text(
          'FlutterLearn',
          style: TextStyle(
            color: vert,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(Icons.person_add_alt_1, size: 55, color: vert),
                const SizedBox(height: 20),

                const Text(
                  'Faites le premier pas.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Créez votre compte et commencez votre apprentissage.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),

                const SizedBox(height: 30),

                const Text('Nom complet'),
                const SizedBox(height: 8),
                TextField(
                  controller: nomController,
                  decoration: InputDecoration(
                    hintText: 'Votre prénom et votre nom',
                    prefixIcon: const Icon(Icons.person_outline),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text('Adresse e-mail'),
                const SizedBox(height: 8),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'exemple@domaine.fr',
                    prefixIcon: const Icon(Icons.email_outlined),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text('Mot de passe'),
                const SizedBox(height: 8),
                TextField(
                  controller: passwordController,
                  obscureText: cacherMotDePasse,
                  decoration: InputDecoration(
                    hintText: 'Créez un mot de passe',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        cacherMotDePasse
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          cacherMotDePasse = !cacherMotDePasse;
                        });
                      },
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  'Je souhaite rejoindre FlutterLearn en tant que :',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 12),

                RadioGroup<String>(
                  groupValue: role,
                  onChanged: (value) {
                    setState(() {
                      role = value!;
                    });
                  },
                  child: const Column(
                    children: [
                      RadioListTile<String>(
                        value: 'Apprenant',
                        title: Text('Apprenant'),
                        subtitle: Text('Suivre des cours et passer des quiz'),
                      ),
                      RadioListTile<String>(
                        value: 'Formateur',
                        title: Text('Formateur'),
                        subtitle: Text('Créer et gérer des cours'),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      if (nomController.text.trim().isEmpty ||
                          emailController.text.trim().isEmpty ||
                          passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Veuillez remplir tous les champs.'),
                          ),
                        );
                        return;
                      }

                      if (!emailController.text.contains('@')) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Adresse e-mail invalide.'),
                          ),
                        );
                        return;
                      }

                      if (passwordController.text.length < 6) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Le mot de passe doit contenir au moins 6 caractères.',
                            ),
                          ),
                        );
                        return;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Inscription prête ! Rôle choisi : $role. '
                            'Firebase sera connecté ensuite.',
                          ),
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
                      'Créer mon compte',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Déjà inscrit ? Se connecter',
                    style: TextStyle(color: vert),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
