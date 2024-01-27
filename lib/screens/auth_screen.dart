import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phoneauth_firebase/screens/otp_validation.dart';
import 'package:phoneauth_firebase/widgets/custom_elevated_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _phoneController = TextEditingController();
  final String _countryCode = "+91";

  void sendOTP() async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: "$_countryCode${_phoneController.text.trim()}",
        verificationCompleted: (phoneAuthCredential) async {
          await _firebaseAuth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          throw Exception(error.toString());
        },
        codeSent: (verificationId, forceResendingToken) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => const OtpValidationScreen(),
            ),
          );
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      print(
        e.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 150,
          ),
          Text(
            'Please enter your mobile number',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 11,
          ),
          Text(
            'You’ll receive a 4 digit code \nto verify next.',
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
            child: TextField(
              controller: _phoneController,
              cursorColor: Colors.purple,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/indiaFlag.png'),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        '+91',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        '-',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 21,
          ),
          const SizedBox(
            height: 21,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomElevatedButton(
              buttonText: "CONTINUE",
              onTap: () {
                sendOTP();
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
    );
  }
}
