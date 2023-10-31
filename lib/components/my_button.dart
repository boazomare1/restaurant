// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sushi/themes/colors.dart';

class MyButton extends StatelessWidget {
  String buttonText;
   Function()? onTap;
  MyButton({
    super.key,
    required this.buttonText,
     required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration:   BoxDecoration(color: secondaryColor,
        borderRadius:  BorderRadius.circular(40)
        ),
        
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //text
            Text(
              buttonText,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              width: 15,
            ),
            const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
