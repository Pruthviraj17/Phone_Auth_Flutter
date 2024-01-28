// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phoneauth_firebase/screens/home_screen.dart';
import 'package:phoneauth_firebase/utils/custom_functions.dart';
import 'package:phoneauth_firebase/widgets/custom_elevated_button.dart';
import 'package:pinput/pinput.dart';

class OtpValidationScreen extends StatefulWidget {
  const OtpValidationScreen({
    super.key,
    required this.verificationId,
    required this.sendOtpAgain,
    required this.phone,
  });
  final String verificationId;
  final void Function() sendOtpAgain;
  final String phone;

  @override
  State<OtpValidationScreen> createState() => _OtpValidationScreenState();
}

class _OtpValidationScreenState extends State<OtpValidationScreen> {
  String? userOtp;
  final FirebaseAuth auth = FirebaseAuth.instance;
  Widget elevatedButtonText = Text(
    "VERIFY AND CONTINUE",
    style: GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: const Color(0xffFFFFFF),
    ),
  );

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
              'Code is sent to ${widget.phone}',
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
                defaultPinTheme: const PinTheme(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xff93D2F3),
                  ),
                  textStyle: TextStyle(
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
                  'Didn\'t receive the code?    ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    color: const Color(0xff6A6C7B),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    widget.sendOtpAgain();
                  },
                  child: Text(
                    'Request Again',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      color: const Color.fromARGB(255, 1, 1, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
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
                buttonText: elevatedButtonText,
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
              child: Image.asset(
                'assets/images/waterWave2.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // verify otp
  void verifyOTP(BuildContext context, String userOtp) async {
    setState(() {
      elevatedButtonText = const Center(
        child: CircularProgressIndicator(
          color: Colors.grey,
        ),
      );
    });
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verificationId, smsCode: userOtp);

      await auth.signInWithCredential(credential);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (ctx) => const HomeScreen(),
          ),
          (route) => false);
    } catch (e) {
      showSnackBar(context, "Invalid OTP!! please try again.");
    }
    setState(() {
      elevatedButtonText = Text(
        "VERIFY AND CONTINUE",
        style: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: const Color(0xffFFFFFF),
        ),
      );
    });
  }
}
