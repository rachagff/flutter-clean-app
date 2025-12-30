import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 360;
    final isVerySmallScreen = screenWidth < 320;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenHeight,
              minWidth: screenWidth,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isVerySmallScreen ? 12.0 : isSmallScreen ? 16.0 : 24.0,
                  vertical: isVerySmallScreen ? 8.0 : 12.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Back button
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back,
                            color: const Color(0xFF1C768C),
                            size: isVerySmallScreen ? 22.0 : 24.0),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ),

                    SizedBox(height: isVerySmallScreen ? 8.0 : 16.0),

                    // Logo
                    Center(
                      child: Container(
                        width: isVerySmallScreen ? 120 : isSmallScreen ? 150 : 200,
                        height: isVerySmallScreen ? 120 : isSmallScreen ? 150 : 200,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF21BBC7),
                              Color(0xFF1C768C),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(
                              isVerySmallScreen ? 45 : isSmallScreen ? 55 : 60),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: isVerySmallScreen ? 10 : 15,
                              spreadRadius: isVerySmallScreen ? 1 : 2,
                            ),
                          ],
                        ),
                        child: Container(
                          margin: EdgeInsets.all(isVerySmallScreen ? 2 : 3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                isVerySmallScreen ? 43 : isSmallScreen ? 52 : 57),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(isVerySmallScreen ? 3 : 5),
                            child: Image.asset(
                              'assets/logo.png',
                              width: isVerySmallScreen ? 110 : isSmallScreen ? 140 : 190,
                              height: isVerySmallScreen ? 110 : isSmallScreen ? 140 : 190,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: isVerySmallScreen ? 8.0 : 16.0),

                    // Title
                    Text(
                      'Bienvenue dans application',
                      style: TextStyle(
                        fontSize: isVerySmallScreen
                            ? 20.0
                            : isSmallScreen
                            ? 24.0
                            : 28.0,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1C768C),
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: isVerySmallScreen ? 4.0 : 8.0),

                    // Subtitle
                    Text(
                      'Connectez-vous pour continuer',
                      style: TextStyle(
                        fontSize: isVerySmallScreen
                            ? 14.0
                            : isSmallScreen
                            ? 15.0
                            : 16.0,
                        color: const Color(0xFF21BBC7),
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: isVerySmallScreen ? 16.0 : 24.0),

                    // Form
                    Expanded(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // Email field
                            _buildTextField(
                              controller: _emailController,
                              label: 'Email',
                              hint: 'Saisissez votre adresse e-mail',
                              prefixIcon: Icons.email,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez saisir votre adresse e-mail';
                                }
                                if (!value.contains('@')) {
                                  return 'Veuillez saisir une adresse e-mail valide';
                                }
                                return null;
                              },
                              isSmallScreen: isSmallScreen,
                              isVerySmallScreen: isVerySmallScreen,
                            ),

                            SizedBox(height: isVerySmallScreen ? 12.0 : 16.0),

                            // Password field
                            TextFormField(
                              controller: _passwordController,
                              obscureText: !_isPasswordVisible,
                              style: TextStyle(
                                color: const Color(0xFF1C768C),
                                fontSize: isVerySmallScreen ? 14.0 : null,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Mot de passe',
                                labelStyle: TextStyle(
                                  color: const Color(0xFF21BBC7),
                                  fontSize: isVerySmallScreen ? 14.0 : null,
                                ),
                                hintText: 'Saisissez votre mot de passe',
                                hintStyle: TextStyle(
                                  color: const Color(0xFFBBBBBB),
                                  fontSize: isVerySmallScreen ? 13.0 : null,
                                ),
                                prefixIcon: Icon(Icons.lock,
                                    color: const Color(0xFF21BBC7),
                                    size: isVerySmallScreen ? 20.0 : null),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: const Color(0xFF21BBC7),
                                    size: isVerySmallScreen ? 20.0 : null,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                  padding: isVerySmallScreen
                                      ? const EdgeInsets.all(8.0)
                                      : null,
                                ),
                                filled: true,
                                fillColor: const Color(0xFFF8FDFE),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      isVerySmallScreen ? 10.0 : 12.0),
                                  borderSide:
                                  const BorderSide(color: Color(0xFFBBF0F4)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      isVerySmallScreen ? 10.0 : 12.0),
                                  borderSide:
                                  const BorderSide(color: Color(0xFFBBF0F4)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      isVerySmallScreen ? 10.0 : 12.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF21BBC7), width: 2),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: isVerySmallScreen ? 14.0 : 16.0,
                                  horizontal: isVerySmallScreen ? 12.0 : 16.0,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez saisir votre mot de passe';
                                }
                                if (value.length < 6) {
                                  return 'Le mot de passe doit comporter au moins 6 caractères.';
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: isVerySmallScreen ? 12.0 : 16.0),

                            // Remember me & Forgot password
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Remember me checkbox
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: isVerySmallScreen ? 0 : 4.0),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(4),
                                            ),
                                            side: const BorderSide(
                                                color: Color(0xFF21BBC7)),
                                            visualDensity: isVerySmallScreen
                                                ? VisualDensity.compact
                                                : VisualDensity.standard,
                                          ),
                                        ),
                                        child: Checkbox(
                                          value: _rememberMe,
                                          onChanged: (value) {
                                            setState(() {
                                              _rememberMe = value!;
                                            });
                                          },
                                          activeColor: const Color(0xFF21BBC7),
                                          checkColor: Colors.white,
                                          materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Souviens-toi de moi',
                                      style: TextStyle(
                                        color: const Color(0xFF1C768C),
                                        fontSize: isVerySmallScreen
                                            ? 12.0
                                            : isSmallScreen
                                            ? 13.0
                                            : 14.0,
                                      ),
                                    ),
                                  ],
                                ),

                                // Forgot password
                                TextButton(
                                  onPressed: () {
                                    // Forgot password action
                                  },
                                  style: TextButton.styleFrom(
                                    padding: isVerySmallScreen
                                        ? const EdgeInsets.all(4.0)
                                        : const EdgeInsets.all(8.0),
                                    minimumSize: Size.zero,
                                    tapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: Text(
                                    'Mot de passe oublié ?',
                                    style: TextStyle(
                                      color: const Color(0xFF21BBC7),
                                      fontWeight: FontWeight.w600,
                                      fontSize: isVerySmallScreen
                                          ? 12.0
                                          : isSmallScreen
                                          ? 13.0
                                          : 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: isVerySmallScreen ? 12.0 : 16.0),

                            // Login button
                            SizedBox(
                              height: isVerySmallScreen ? 48.0 : 52.0,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.pushReplacementNamed(
                                        context, '/home');
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF21BBC7),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        isVerySmallScreen ? 10.0 : 12.0),
                                  ),
                                  elevation: 4,
                                  shadowColor: const Color(0xFF21BBC7)
                                      .withOpacity(0.4),
                                ),
                                child: Text(
                                  'Se connecter',
                                  style: TextStyle(
                                    fontSize: isVerySmallScreen
                                        ? 16.0
                                        : isSmallScreen
                                        ? 18.0
                                        : 20.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: isVerySmallScreen ? 16.0 : 24.0),

                            // Sign up link
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Vous n'avez pas de compte ? ",
                                  style: TextStyle(
                                    color: const Color(0xFF666666),
                                    fontSize: isVerySmallScreen
                                        ? 13.0
                                        : isSmallScreen
                                        ? 14.0
                                        : 15.0,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/singup');
                                  },
                                  child: Text(
                                    "S'inscrire",
                                    style: TextStyle(
                                      color: const Color(0xFF1C768C),
                                      fontWeight: FontWeight.bold,
                                      fontSize: isVerySmallScreen
                                          ? 13.0
                                          : isSmallScreen
                                          ? 14.0
                                          : 15.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: isVerySmallScreen ? 16.0 : 24.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData prefixIcon,
    required String? Function(String?)? validator,
    required bool isSmallScreen,
    required bool isVerySmallScreen,
  }) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        color: const Color(0xFF1C768C),
        fontSize: isVerySmallScreen ? 14.0 : null,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: const Color(0xFF21BBC7),
          fontSize: isVerySmallScreen ? 14.0 : null,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          color: const Color(0xFFBBBBBB),
          fontSize: isVerySmallScreen ? 13.0 : null,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: const Color(0xFF21BBC7),
          size: isVerySmallScreen ? 20.0 : null,
        ),
        filled: true,
        fillColor: const Color(0xFFF8FDFE),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(isVerySmallScreen ? 10.0 : 12.0),
          borderSide: const BorderSide(color: Color(0xFFBBF0F4)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(isVerySmallScreen ? 10.0 : 12.0),
          borderSide: const BorderSide(color: Color(0xFFBBF0F4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(isVerySmallScreen ? 10.0 : 12.0),
          borderSide:
          const BorderSide(color: Color(0xFF21BBC7), width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: isVerySmallScreen ? 14.0 : 16.0,
          horizontal: isVerySmallScreen ? 12.0 : 16.0,
        ),
      ),
      validator: validator,
    );
  }
}
