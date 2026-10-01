import 'package:dermaconnect/components/button.dart';
import 'package:dermaconnect/components/my_textfields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
   const LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
// text editing controllersss
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(child: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),

            Text('Welcome! Let\'s get you signed in.',
            style: GoogleFonts.dmSerifDisplay(fontSize: 30,
            color: const Color.fromARGB(255, 3, 6, 59),),),

            const SizedBox(height: 25),

            // textfields
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
              ForgotButton(text: "Forgot Password?",
           onTap: (){
            Navigator.pushNamed(context, '/resetpage');
           },
           ),
            const SizedBox(height: 25),

            // sign in button!

            SignButton(text: "Sign In",
           onTap: (){
            Navigator.pushNamed(context, '/homepage');
           },
           ),

           const SizedBox(height: 50),

           // Register account
          RegisterButton(text: "Register an account",
           onTap: (){
            Navigator.pushNamed(context, '/registerpage');
           },
           ),

           const SizedBox(height: 50),

           // Continue as Guest Button

           GuestButton(text: "Continue as guest",
           onTap: (){
            Navigator.pushNamed(context, '/homepage');
           },
           ),


          ],
        ),
      ))
    );
  }
}