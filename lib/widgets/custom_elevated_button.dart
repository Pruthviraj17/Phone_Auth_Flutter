import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.width = double.infinity,
  });

  final void Function() onTap;
  final String buttonText;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(),
          backgroundColor: const Color(0xff2E3B62),
        ),
        child: Text(
          buttonText,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: const Color(0xffFFFFFF),
          ),
        ),
      ),
    );
  }
}
