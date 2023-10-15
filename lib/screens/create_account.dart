import 'package:flutter/material.dart';
import 'package:pod_wave/components/custom_button.dart';
import 'package:pod_wave/components/custom_text_field.dart';
import 'package:pod_wave/constants.dart';
import 'package:pod_wave/screens/sign_in.dart';

import '../components/inputLabel.dart';
import '../components/social_button.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  static String id = 'create_account';

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

bool agree = false;

class _CreateAccountState extends State<CreateAccount> {
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
                'Create new account',
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const InputLabel(
                      label: 'Full name',
                    ),
                    CustomTextField(
                      onChanged: (value) {},
                      hint: 'Username',
                      icon: Image.asset('assets/images/icons/user.png'),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    const InputLabel(
                      label: 'Email address',
                    ),
                    CustomTextField(
                      hint: 'Email',
                      onChanged: (value) {},
                      icon: Image.asset('assets/images/icons/email.png'),
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
                      icon: Image.asset('assets/images/icons/password.png'),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: agree,
                          onChanged: (value) {
                            setState(
                              () {
                                agree = value!;
                              },
                            );
                          },
                          fillColor:
                              const MaterialStatePropertyAll(kButtonColor),
                        ),
                        const Text(
                          'I agree with Terms and Privacy Policy',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            fontFamily: 'Inter',
                            color: kTextColor,
                          ),
                        ),
                      ],
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
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    Center(
                      child: CustomButton(
                        text: 'Create new account',
                        onPressed: () {
                          Navigator.pushNamed(context, SignIn.id);
                        },
                        width: 0.0,
                      ),
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
