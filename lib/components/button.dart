import 'package:flutter/material.dart';


// Lets get started Button

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  
  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 0, 28, 54), borderRadius: BorderRadius.circular(40),),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
      
            Text(text,
             style: TextStyle(color: Color.fromARGB(255, 253, 252, 252))),
          ],
        ),
      ),
    );
  }
}

// Sign In Button

class SignButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  
  const SignButton({
    super.key,
    required this.text,
    required this.onTap,
    });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 400,
        decoration: BoxDecoration(color: Color.fromARGB(255, 0, 28, 54), borderRadius: BorderRadius.circular(40),),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
      
            Text(text,
             style: TextStyle(color: Color.fromARGB(255, 253, 252, 252), fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

// Forgot Password

class ForgotButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  
  const ForgotButton({
    super.key,
    required this.text,
    required this.onTap,
    });
  
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250,
        decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255),),
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
      
            Text(text,
             style: TextStyle(color: Color.fromARGB(255, 165, 165, 165), decoration: TextDecoration.underline),),
          ],
        ),
      ),
    ),
    );
  }
}

// Register an account

class RegisterButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  
  const RegisterButton({
    super.key,
    required this.text,
    required this.onTap,
    });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 350,
        decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255),),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
      
            Text(text,
             style: TextStyle(color: Color.fromARGB(255, 0, 28, 54), fontSize: 18, decoration: TextDecoration.underline)),
          ],
        ),
      ),
    );
  }
}

// Continue as guest button

class GuestButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  
  const GuestButton({
    super.key,
    required this.text,
    required this.onTap,
    });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250,
        decoration: BoxDecoration(color: Color.fromARGB(255, 113, 117, 121), borderRadius: BorderRadius.circular(40),),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
      
            Text(text,
             style: TextStyle(color: Color.fromARGB(255, 253, 252, 252))),
          ],
        ),
      ),
    );
  }
}

// Reset Button

class ResetButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  
  const ResetButton({
    super.key,
    required this.text,
    required this.onTap,
    });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250,
        decoration: BoxDecoration(color: const Color.fromARGB(255, 3, 6, 59), borderRadius: BorderRadius.circular(40),),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
      
            Text(text,
             style: TextStyle(color: Color.fromARGB(255, 253, 252, 252))),
          ],
        ),
      ),
    );
  }
}

// Register Button

class RegisterButton2 extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  
  const RegisterButton2({
    super.key,
    required this.text,
    required this.onTap,
    });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250,
        decoration: BoxDecoration(color: const Color.fromARGB(255, 3, 6, 59), borderRadius: BorderRadius.circular(40),),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
      
            Text(text,
             style: TextStyle(color: Color.fromARGB(255, 253, 252, 252), fontSize: 18, fontWeight: FontWeight(10))),
          ],
        ),
      ),
    );
  }
}