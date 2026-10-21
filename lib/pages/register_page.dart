import 'package:dermaconnect/components/button.dart';
import 'package:dermaconnect/components/my_textfields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    firstNameController.dispose();
    secondNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _showMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _register() async {
    if (_isLoading) return;

    final firstName = firstNameController.text.trim();
    final secondName = secondNameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (firstName.isEmpty || secondName.isEmpty || email.isEmpty || password.isEmpty) {
      _showMessage('Please fill in all the fields.');
      return;
    }
    if (!email.contains('@') || !email.contains('.')) {
      _showMessage('Please enter a valid email address.');
      return;
    }
    if (password.length < 8) {
      _showMessage('Your password must be at least 8 characters long.');
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
        data: {'full_name': '$firstName $secondName'},
      );

      if (!mounted) return;

      // If the email is already registered, Supabase returns a user with
      // no identities instead of an error.
      final identities = response.user?.identities;
      if (identities != null && identities.isEmpty) {
        _showMessage('An account with this email already exists. Please sign in.');
        return;
      }

      if (response.session != null) {
        // Email confirmation is switched off: the user is signed in already.
        Navigator.pushNamedAndRemoveUntil(context, '/homepage', (route) => false);
      } else {
        // Email confirmation is switched on: the user must confirm first.
        _showMessage('Account created. Please check your email to confirm it, then sign in.');
        Navigator.pushNamedAndRemoveUntil(context, '/loginpage', (route) => false);
      }
    } on AuthException catch (e) {
      _showMessage(e.message);
    } catch (_) {
      _showMessage('Something went wrong. Please check your connection and try again.');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),

              Text(
                'Register an Account',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 30,
                  color: const Color.fromARGB(255, 3, 6, 59),
                ),
              ),

              const SizedBox(height: 25),

              const SizedBox(height: 10),

              // first name
              MyTextfields(
                controller: firstNameController,
                hintText: 'First Name',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // second name
              MyTextfields(
                controller: secondNameController,
                hintText: 'Surname',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // email
              MyTextfields(
                controller: emailController,
                hintText: 'Email Address',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password
              MyTextfields(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 15),

              // register button
              RegisterButton2(
                text: _isLoading ? "Registering..." : "Register",
                onTap: _register,
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}