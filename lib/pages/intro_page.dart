import 'package:dermaconnect/components/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 3, 6, 59),
        body: Padding(padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
           const SizedBox(height:25),
          

           // App name
           Text("DermaConnect", style: GoogleFonts.dmSerifDisplay(
            fontSize: 30,
            color: Colors.white,
           ),),

            

           // logo


           // subtitle?
           Text("Scan. Connect.", style: GoogleFonts.dmSerifDisplay(fontSize: 25, color: Colors.grey[200]),),

           const SizedBox(height: 5),


           // get started button - bottom maybe
           MyButton(text: "Get Started →",
           onTap: (){
            Navigator.pushNamed(context, '/loginpage');
           },
           ),
        ],
      ),
    ),
    );
}
}