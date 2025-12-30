import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Back button
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Color(0xFF1C768C)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),

                  // Logo
                  Center(
                    child: Container(
                      width: 150,
                      height: 150,

                      child: Container(
                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(57),
                        ),


                          child: Image.asset(
                            'assets/logo.png',
                            width: 150,
                            height: 150,
                            fit: BoxFit.contain,
                          ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Title
                  const Text(
                    'Créer un compte',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C768C),
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Inscrivez-vous pour commencer',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF21BBC7),
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),

                  // Form
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Full Name field
                        TextFormField(
                          controller: _fullNameController,
                          style: const TextStyle(color: Color(0xFF1C768C)),
                          decoration: InputDecoration(
                            labelText: 'Nom complet',
                            labelStyle: const TextStyle(color: Color(0xFF21BBC7)),
                            hintText: 'Saisissez votre nom complet',
                            hintStyle: const TextStyle(color: Color(0xFFBBBBBB)),
                            prefixIcon: const Icon(Icons.person, color: Color(0xFF21BBC7)),
                            filled: true,
                            fillColor: const Color(0xFFF8FDFE),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFFBBF0F4)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFFBBF0F4)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFF21BBC7), width: 2),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez saisir votre nom complet';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        // Email field
                        TextFormField(
                          controller: _emailController,
                          style: const TextStyle(color: Color(0xFF1C768C)),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: const TextStyle(color: Color(0xFF21BBC7)),
                            hintText: 'Saisissez votre adresse e-mail',
                            hintStyle: const TextStyle(color: Color(0xFFBBBBBB)),
                            prefixIcon: const Icon(Icons.email, color: Color(0xFF21BBC7)),
                            filled: true,
                            fillColor: const Color(0xFFF8FDFE),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFFBBF0F4)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFFBBF0F4)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFF21BBC7), width: 2),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez saisir votre adresse e-mail';
                            }
                            if (!value.contains('@')) {
                              return 'Veuillez saisir une adresse e-mail valide';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        // Phone field
                        TextFormField(
                          controller: _phoneController,
                          style: const TextStyle(color: Color(0xFF1C768C)),
                          decoration: InputDecoration(
                            labelText: 'Téléphone',
                            labelStyle: const TextStyle(color: Color(0xFF21BBC7)),
                            hintText: 'Saisissez votre numéro de téléphone',
                            hintStyle: const TextStyle(color: Color(0xFFBBBBBB)),
                            prefixIcon: const Icon(Icons.phone, color: Color(0xFF21BBC7)),
                            filled: true,
                            fillColor: const Color(0xFFF8FDFE),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFFBBF0F4)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFFBBF0F4)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFF21BBC7), width: 2),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez saisir votre numéro de téléphone';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        // Password field
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          style: const TextStyle(color: Color(0xFF1C768C)),
                          decoration: InputDecoration(
                            labelText: 'Mot de passe',
                            labelStyle: const TextStyle(color: Color(0xFF21BBC7)),
                            hintText: 'Saisissez votre mot de passe',
                            hintStyle: const TextStyle(color: Color(0xFFBBBBBB)),
                            prefixIcon: const Icon(Icons.lock, color: Color(0xFF21BBC7)),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                color: const Color(0xFF21BBC7),
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF8FDFE),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFFBBF0F4)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFFBBF0F4)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFF21BBC7), width: 2),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez saisir votre mot de passe';
                            }
                            if (value.length < 6) {
                              return 'Le mot de passe doit comporter au moins 6 caractères';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        // Confirm Password field
                        TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: !_isConfirmPasswordVisible,
                          style: const TextStyle(color: Color(0xFF1C768C)),
                          decoration: InputDecoration(
                            labelText: 'Confirmer le mot de passe',
                            labelStyle: const TextStyle(color: Color(0xFF21BBC7)),
                            hintText: 'Confirmez votre mot de passe',
                            hintStyle: const TextStyle(color: Color(0xFFBBBBBB)),
                            prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF21BBC7)),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                color: const Color(0xFF21BBC7),
                              ),
                              onPressed: () {
                                setState(() {
                                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                                });
                              },
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF8FDFE),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFFBBF0F4)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFFBBF0F4)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFF21BBC7), width: 2),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez confirmer votre mot de passe';
                            }
                            if (value != _passwordController.text) {
                              return 'Les mots de passe ne correspondent pas';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        // Terms and conditions
                        Row(
                          children: [
                            Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  side: const BorderSide(color: Color(0xFF21BBC7)),
                                ),
                              ),
                              child: Checkbox(
                                value: _acceptTerms,
                                onChanged: (value) {
                                  setState(() {
                                    _acceptTerms = value!;
                                  });
                                },
                                activeColor: const Color(0xFF21BBC7),
                                checkColor: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: RichText(
                                text: const TextSpan(
                                  text: "J'accepte les ",
                                  style: TextStyle(color: Color(0xFF1C768C)),
                                  children: [
                                    TextSpan(
                                      text: 'Conditions d\'utilisation',
                                      style: TextStyle(
                                        color: Color(0xFF21BBC7),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(text: ' et la '),
                                    TextSpan(
                                      text: 'Politique de confidentialité',
                                      style: TextStyle(
                                        color: Color(0xFF21BBC7),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Sign up button - Made larger
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate() && _acceptTerms) {
                                Navigator.pushReplacementNamed(context, '/home');
                              } else if (!_acceptTerms) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Veuillez accepter les conditions d\'utilisation'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF21BBC7),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 3,
                              shadowColor: const Color(0xFF21BBC7).withOpacity(0.4),
                            ),
                            child: const Text(
                              "S'inscrire",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Login link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Vous avez déjà un compte ? ',
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontSize: 15,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(context, '/login');
                              },
                              child: const Text(
                                'Se connecter',
                                style: TextStyle(
                                  color: Color(0xFF1C768C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
