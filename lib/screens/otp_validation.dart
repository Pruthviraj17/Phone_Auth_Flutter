import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phoneauth_firebase/screens/home_screen.dart';
import 'package:phoneauth_firebase/utils/custom_functions.dart';
import 'package:phoneauth_firebase/widgets/custom_elevated_button.dart';
import 'package:pinput/pinput.dart';

class OtpValidationScreen extends StatefulWidget {
  const OtpValidationScreen({super.key});

  @override
  State<OtpValidationScreen> createState() => _OtpValidationScreenState();
}

class _OtpValidationScreenState extends State<OtpValidationScreen> {
  String? userOtp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            Text(
              'Verify Phone',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            Text(
              'Code is sent to 8094508485',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: const Color(0xff6A6C7B),
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 21,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Pinput(
                length: 6,
                showCursor: true,
                defaultPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade400)),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onCompleted: (value) {
                  setState(() {
                    userOtp = value;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 21,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Didn’t receive the code?    ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    color: const Color(0xff6A6C7B),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Request Again',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    color: const Color.fromARGB(255, 1, 1, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 21,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomElevatedButton(
                buttonText: 'VERIFY AND CONTINUE',
                onTap: () {
                  if (userOtp != null) {
                    verifyOTP(context, userOtp!);
                  } else {
                    showSnackBar(context, "Please enter 6-digit code");
                  }
                },
              ),
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Positioned(
                top: 80,
                child: Image.asset(
                  'assets/images/waterWave2.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // verify otp
  void verifyOTP(BuildContext context, String userOtp) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx) => const HomeScreen(),
        ),
        (route) => false);
  }
}
