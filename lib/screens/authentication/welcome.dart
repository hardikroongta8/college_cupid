import 'package:college_cupid/functions/launchers.dart';
import 'package:college_cupid/functions/snackbar.dart';
import 'package:college_cupid/screens/authentication/login_webview.dart';
import 'package:college_cupid/shared/colors.dart';
import 'package:college_cupid/widgets/global/cupid_button.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  static String id = '/welcome';

  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'CollegeCupid',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'SedgwickAve',
              fontWeight: FontWeight.bold,
              color: CupidColors.titleColor,
              fontSize: 44,
            ),
          ),
          SizedBox(
            width: 0.8 * screenWidth,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset('assets/images/couple.jpg'),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('By continuing, you are agreeing to our '),
                    GestureDetector(
                      onTap: () async {
                        try {
                          await launchURL(
                              host: 'swc.iitg.ac.in',
                              path: '/collegeCupid/terms');
                        } catch (e) {
                          showSnackBar(e.toString());
                        }
                      },
                      child: const Text(
                        'Terms of use',
                        style: TextStyle(color: CupidColors.titleColor),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: CupidButton(
                  text: 'Continue with Outlook',
                  onTap: () {
                    Navigator.pushReplacementNamed(context, LoginWebview.id);
                  },
                  height: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
