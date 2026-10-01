import 'package:dermaconnect/components/button.dart';
import 'package:dermaconnect/components/my_textfields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPage extends StatefulWidget {
   const ResetPage({super.key});


  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
// text editing controllersss
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(child: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),

            Text('Reset your password',
            style: GoogleFonts.dmSerifDisplay(fontSize: 30,
            color: const Color.fromARGB(255, 3, 6, 59),),),

            const SizedBox(height: 25),

            // textfields

            const SizedBox(height: 10),

            // passwords textfields
            MyTextfields(
              controller: newPasswordController,
              hintText: 'New Password',
              obscureText: true,
            ),

            // passwords textfields
            MyTextfields(
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
              obscureText: true,
            ),

             const SizedBox(height: 10),

            // reset button!

            ResetButton(text: "Reset Password",
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