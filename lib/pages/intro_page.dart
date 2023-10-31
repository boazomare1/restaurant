import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/components/my_button.dart';
import 'package:sushi/themes/colors.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 25,
            ),
            //shop name
            Text(
              'SUSHI MAN',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            //icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('assets/images/sushi.png'),
            ),

            const SizedBox(
              height: 25,
            ),
            //title
            Text(
              "THE TASTE OF JAPANESE FOOD",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 44, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            //subtitle
            Text('Feel the taste of Japanese food from anywhere anytime',
                style: TextStyle(
                  color: Colors.grey[300],
                  height: 2,
                )),
            const SizedBox(
              height: 25,
            ),
            //get started button
            MyButton(
              buttonText: "Get Started",
              onTap: () {
                //go to the menu page
                Navigator.pushNamed(context, '/menupage');
              },
            )
          ],
        ),
      ),
    );
  }
}
