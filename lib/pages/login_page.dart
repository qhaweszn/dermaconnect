import 'package:dermaconnect/components/button.dart';
import 'package:dermaconnect/components/my_textfields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
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

  Future<void> _signIn() async {
    if (_isLoading) return;

    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showMessage('Please enter your email and password.');
      return;
    }

    setState(() => _isLoading = true);

    try {
      await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(context, '/homepage', (route) => false);
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
                'Welcome! Let\'s get you signed in.',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 30,
                  color: const Color.fromARGB(255, 3, 6, 59),
                ),
              ),

              const SizedBox(height: 25),

              // email textfield
              MyTextfields(
                controller: emailController,
                hintText: 'Email Address',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextfields(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // forgot password
              ForgotButton(
                text: "Forgot Password?",
                onTap: () {
                  Navigator.pushNamed(context, '/resetpage');
                },
              ),

              const SizedBox(height: 25),

              // sign in button
              SignButton(
                text: _isLoading ? "Signing in..." : "Sign In",
                onTap: _signIn,
              ),

              const SizedBox(height: 50),

              // register account
              RegisterButton(
                text: "Register an account",
                onTap: () {
                  Navigator.pushNamed(context, '/registerpage');
                },
              ),

              const SizedBox(height: 50),

              // continue as guest
              GuestButton(
                text: "Continue as guest",
                onTap: () {
                  Navigator.pushNamed(context, '/homepage');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}