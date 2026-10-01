import 'package:dermaconnect/components/button.dart';
import 'package:dermaconnect/components/my_textfields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
   const RegisterPage({super.key});


  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
// text editing controllersss
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
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

            Text('Register an Account',
            style: GoogleFonts.dmSerifDisplay(fontSize: 30,
            color: const Color.fromARGB(255, 3, 6, 59),),),

            const SizedBox(height: 25),

            // textfields

            const SizedBox(height: 10),

            // First Name textfields
            MyTextfields(
              controller: firstNameController,
              hintText: 'First Name',
              obscureText: false,
            ),

            const SizedBox(height: 10),

            // Second Name textfields
            MyTextfields(
              controller: secondNameController,
              hintText: 'Second Name',
              obscureText: false,
            ),

            const SizedBox(height: 10),

             MyTextfields(
              controller: emailController,
              hintText: 'Email Address',
              obscureText: false,
            ),

            const SizedBox(height: 10),

            // passwords textfields
            MyTextfields(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),

             const SizedBox(height: 15),

            // Register Button

            RegisterButton2(text: "Register",
           onTap: (){
            Navigator.pushNamed(context, '/homepage');
           },
           ),

           const SizedBox(height: 50),
          ],
        ),
      ))
    );
  }
}