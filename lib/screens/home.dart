import 'package:flutter/material.dart';
import 'package:pod_wave/constants.dart';
import 'package:pod_wave/screens/home_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      if (_controller.indexIsChanging || _controller.animation != null) {
        setState(() {
          _activeIndex = _controller.index;
        });
      }
    });
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackgroundColor,
      bottomNavigationBar: TabBar(
        dividerColor: Colors.transparent,
        overlayColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
        automaticIndicatorColorAdjustment: true,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
        controller: _controller,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
              width: 2.0,
              color: kHeadingColor), // Adjust the width and color as needed
        ),
        tabs: [
          Tab(
            // child: Image.asset(
            //   'assets/images/icons/home.png',
            // ),
            child: IconWidget(
              activeIndex: _activeIndex,
              url: 'assets/images/icons/home.png',
              index: 0,
              activeIcon: 'assets/images/icons/dHome.png',
            ),
          ),
          Tab(
            // child: Image.asset('assets/images/icons/category.png'),
            child: IconWidget(
              activeIndex: _activeIndex,
              url: 'assets/images/icons/category.png',
              index: 1,
              activeIcon: 'assets/images/icons/dCategory.png',
            ),
          ),
          Tab(
            // child: Image.asset('assets/images/icons/library.png'),
            child: IconWidget(
              activeIndex: _activeIndex,
              url: 'assets/images/icons/library.png',
              index: 2,
              activeIcon: 'assets/images/icons/dLib.png',
            ),
          ),
          Tab(
            // child: Image.asset('assets/images/icons/setting.png'),
            child: IconWidget(
              activeIndex: _activeIndex,
              url: 'assets/images/icons/setting.png',
              index: 3,
              activeIcon: 'assets/images/icons/dSetting.png',
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          const HomeTab(),
          Image.asset('assets/images/icons/category.png'),
          Image.asset('assets/images/icons/library.png'),
          Image.asset('assets/images/icons/setting.png'),
        ],
      ),
    ));
  }
}

class IconWidget extends StatelessWidget {
  const IconWidget({
    Key? key,
    required int activeIndex,
    required this.url,
    required this.index,
    required this.activeIcon,
  })  : _activeIndex = activeIndex,
        super(key: key);

  final int _activeIndex;
  final String url;
  final int index;
  final String activeIcon;

  String getIcon(BuildContext context) {
    if (_activeIndex == index) {
      return activeIcon;
    } else {
      return url;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      getIcon(context),
      height: 25.0,
      color: kHeadingColor,
    );
  }
}
