import 'package:flutter/material.dart';
import 'package:pod_wave/components/custom_button.dart';
import 'package:pod_wave/components/inputLabel.dart';
import 'package:pod_wave/constants.dart';
import 'package:pod_wave/screens/home.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  static String id = 'select_page';

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
              'What do you like?',
              style: TextStyle(
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0,
                  color: kHeadingColor),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: InputLabel(label: 'Tap to select'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.45,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          SelectionWidget(
                            image:
                                Image.asset('assets/images/icons/Politic.png'),
                          ),
                          SelectionWidget(
                            image: Image.asset(
                                'assets/images/icons/education.png'),
                          ),
                          SelectionWidget(
                            image: Image.asset('assets/images/icons/art.png'),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          SelectionWidget(
                            image: Image.asset(
                                'assets/images/icons/relationship.png'),
                          ),
                          SelectionWidget(
                            image:
                                Image.asset('assets/images/icons/Language.png'),
                          ),
                          SelectionWidget(
                            image: Image.asset('assets/images/icons/humor.png'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Center(
              child: CustomButton(
                text: 'Start',
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.id);
                },
                width: 112.0,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class SelectionWidget extends StatefulWidget {
  const SelectionWidget({
    super.key,
    required this.image,
  });

  final Image image;

  @override
  State<SelectionWidget> createState() => _SelectionWidgetState();
}

bool isChecked = false;
bool isVisible = false;

class _SelectionWidgetState extends State<SelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isChecked = !isChecked;
                isVisible = !isVisible;
              });
            },
            child: Container(
              // height: 170,
              color: Colors.transparent,
              child: widget.image,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              height: 15.0,
              width: 15.0,
              child: Visibility(
                visible: isVisible,
                child: Checkbox(
                  checkColor: kHeadingColor,
                  activeColor: kBackgroundColor,
                  value: isChecked,
                  onChanged: (value) {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
* return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () {},
        child: Image.asset(''),
      ),
    );*/
