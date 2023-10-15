import 'package:flutter/material.dart';
import 'package:pod_wave/constants.dart';
import 'package:pod_wave/screens/sign_in.dart';

import '../components/custom_button.dart';
import 'create_account.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  static String id = 'start_screen';

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kHeadingColor,
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(150.0),
                    bottomRight: Radius.circular(150.0),
                  ),
                ),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..translate(0.0, 10.0, 0.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(150.0),
                        bottomRight: Radius.circular(150.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 12.0),
                      child: Image(
                        image: AssetImage('assets/images/start_screen.png'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(150.0),
                    topRight: Radius.circular(150.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 38.0),
                      child: SizedBox(
                        width: 38.0,
                        child: Divider(
                          height: 6.0,
                          thickness: 6.0,
                          color: kHeadingColor,
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 28.0, vertical: 8),
                      child: Text(
                        'Listen to the best Podcast',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'NotoSans',
                            fontSize: 32.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Text(
                      'Your favorite artists in one place',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                          color: kTextColor),
                    ),
                    const SizedBox(
                      height: 46,
                    ),
                    CustomButton(
                      text: 'Create new account',
                      onPressed: () {
                        Navigator.pushNamed(context, CreateAccount.id);
                      },
                      width: 0.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignIn.id);
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                          fontFamily: 'NotoSans',
                          color: kHeadingColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6.0,
                      child: Divider(
                        height: 3.0,
                        thickness: 3.0,
                        color: kHeadingColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
