import 'package:flutter/material.dart';
import 'package:pod_wave/components/custom_button.dart';
import 'package:pod_wave/components/custom_text_field.dart';
import 'package:pod_wave/components/inputLabel.dart';
import 'package:pod_wave/components/social_button.dart';
import 'package:pod_wave/constants.dart';
import 'package:pod_wave/screens/select_page.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  static String id = 'sign_in';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  Color iconColor = kHeadingColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              const Text(
                'Sign in',
                style: TextStyle(
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w600,
                    fontSize: 24.0,
                    color: kHeadingColor),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const InputLabel(
                      label: 'Email address',
                    ),
                    CustomTextField(
                      hint: 'Email',
                      onChanged: (value) {},
                      icon: Image.asset(
                        'assets/images/icons/email.png',
                        color: iconColor,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    const InputLabel(
                      label: 'Password',
                    ),
                    CustomTextField(
                      hint: 'Password',
                      onChanged: (value) {},
                      icon: Image.asset(
                        'assets/images/icons/password.png',
                        color: iconColor,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    const Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 14.0),
                            child: SizedBox(
                              height: 30.0,
                              child: VerticalDivider(
                                thickness: 1.0,
                                color: kTextColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 14.0),
                            child: Text(
                              'OR',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                                fontFamily: 'Inter',
                                color: kHeadingColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SocialButton(
                          image: Image.asset('assets/images/icons/google.png'),
                          name: 'Google',
                          onPressed: () {},
                        ),
                        SocialButton(
                          image:
                              Image.asset('assets/images/icons/facebook.png'),
                          name: 'Facebook',
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.19,
                    ),
                    Center(
                      child: CustomButton(
                        text: 'Sign in',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, SelectPage.id);
                          } else {
                            setState(() {
                              iconColor = kErrorColor;
                            });
                          }
                        },
                        width: 0.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Forgot your password?',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                            fontFamily: 'NotoSans',
                            color: kHeadingColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Click here',
                            style: TextStyle(
                                fontFamily: 'NotoSans',
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0,
                                color: kButtonColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
