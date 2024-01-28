import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phoneauth_firebase/screens/welcome_screen.dart';
import 'package:phoneauth_firebase/widgets/custom_elevated_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String radioValue = "shipper";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                // barrierDismissible: false,
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("LOGOUT"),
                  content: const Text("Do you really want to logout"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "NO",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (ctx) => const WelcomeScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: const Text(
                        "YES",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 51,
            ),
            Text(
              'Please select your profile',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 21,
            ),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Row(
                children: [
                  Radio(
                    activeColor: const Color(0xff2E3B62),
                    value: "shipper",
                    groupValue: radioValue,
                    onChanged: (value) {
                      setState(() {
                        radioValue = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 11,
                  ),
                  Image.asset('assets/images/shipperImage.png'),
                  const SizedBox(
                    width: 21,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shipper",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, \nconsectetur adipiscing",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 21,
            ),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Row(
                children: [
                  Radio(
                    activeColor: const Color(0xff2E3B62),
                    value: "transporter",
                    groupValue: radioValue,
                    onChanged: (value) {
                      setState(() {
                        radioValue = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 11,
                  ),
                  Image.asset('assets/images/transportImage.png'),
                  const SizedBox(
                    width: 21,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Transporter",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, \nconsectetur adipiscing",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 21,
            ),
            CustomElevatedButton(
              buttonText: Text(
                "CONTINUE",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xffFFFFFF),
                ),
              ),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
