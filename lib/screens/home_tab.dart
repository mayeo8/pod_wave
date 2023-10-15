import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pod_wave/constants.dart';
import 'package:pod_wave/screens/player_screen.dart';

import '../data.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  static String id = 'home_screen';

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool like = false;
  bool recommendLike = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //greeting
                    Text(
                      'Hello, Kate!',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(Icons.favorite_border_sharp),
                    //greeting
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                //for you text
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'For You',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                //for you text
                const SizedBox(
                  height: 10.0,
                ),
                //for you slide
                SizedBox(
                  height: 104,
                  width: double.infinity,
                  child: ListView.builder(
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: getForYouPodcast.length,
                    itemBuilder: (BuildContext context, int index) {
                      final podcast = getForYouPodcast[index];
                      return SizedBox(
                        width: 287,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PlayerScreen(
                                    channel: podcast.chanel!,
                                    liked: podcast.liked,
                                    title: podcast.title,
                                    author: podcast.author!),
                              ),
                            );
                          },
                          child: Card(
                            color: const Color(0xFFF2EFED),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.asset(podcast.image),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, left: 12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 175,
                                          child: Text(
                                            podcast.title,
                                            style: const TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'NotoSans',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              podcast.date!,
                                              style: const TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w500,
                                                color: kTextColor,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            Text(
                                              podcast.length!,
                                              style: const TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w500,
                                                color: kTextColor,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 30.0,
                                            ),
                                            Text(
                                              formatNumber(podcast.likes!),
                                              style: const TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w500,
                                                color: kTextColor,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  podcast.toggleLike();
                                                });
                                              },
                                              child: Icon(
                                                podcast.liked
                                                    ? Icons.thumb_up
                                                    : Icons
                                                        .thumb_up_off_alt_outlined,
                                                size: 16,
                                                color: kTextColor,
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
                        ),
                      );
                    },
                  ),
                ),
                //for you slide
                const SizedBox(
                  height: 20.0,
                ),
                //middle
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PlayerScreen(
                            channel: middlePod.chanel!,
                            liked: middlePod.liked,
                            title: middlePod.title,
                            author: middlePod.author!),
                      ),
                    );
                  },
                  child: Container(
                    width: 362,
                    height: 123,
                    decoration: BoxDecoration(
                      color: kHeadingColor,
                      image: DecorationImage(
                        image: AssetImage(middlePod.image),
                      ),
                      borderRadius: BorderRadius.circular(28.8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 18.0,
                        left: 20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'by: Live better',
                            style: TextStyle(
                                fontSize: 12.0,
                                fontFamily: 'NotoSans',
                                fontWeight: FontWeight.w400,
                                color: kTextColor),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          SizedBox(
                            width: 162,
                            child: Text(
                              middlePod.title,
                              style: const TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: 'NotoSans',
                                  fontWeight: FontWeight.w600,
                                  color: kBackgroundColor),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Text(
                                middlePod.date!,
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  color: kTextColor,
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                middlePod.length!,
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  color: kTextColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // middle
                const SizedBox(
                  height: 40.0,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //greeting
                    Text(
                      'Your subscriptions',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'NotoSans',
                          fontWeight: FontWeight.w600,
                          color: kHeadingColor),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    //greeting
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: ListView.builder(
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: getSubscribedPodcast.length,
                    itemBuilder: (BuildContext context, int index) {
                      final podcast = getSubscribedPodcast[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PlayerScreen(
                                  channel: podcast.chanel!,
                                  liked: podcast.liked,
                                  title: podcast.title,
                                  author: podcast.author!),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                width: 124,
                                height: 124,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(podcast.image),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(14)),
                              ),
                              SizedBox(
                                width: 127,
                                child: Text(
                                  podcast.title,
                                  style: const TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'NotoSans'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Recommended',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.w600,
                      color: kHeadingColor),
                ),
                SizedBox(
                  height: 109,
                  width: double.infinity,
                  child: ListView.builder(
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: getRecommendedPodcast.length,
                    itemBuilder: (BuildContext context, int index) {
                      final podcast = getRecommendedPodcast[index];
                      return SizedBox(
                        width: 257,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PlayerScreen(
                                    channel: podcast.chanel!,
                                    liked: podcast.liked,
                                    title: podcast.title,
                                    author: podcast.author!),
                              ),
                            );
                          },
                          child: Card(
                            color: recommendedColor[index],
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.asset(podcast.image),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0, left: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 175,
                                          child: Text(
                                            podcast.title,
                                            style: const TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'NotoSans',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 6.0,
                                        ),
                                        Text(
                                          '\u2022 ${podcast.chanel!}',
                                          style: const TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500,
                                            color: kTextColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 6.0,
                                        ),
                                        SizedBox(
                                          width: 175.0,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                formatNumber(podcast.likes!),
                                                style: const TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: kTextColor,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 2.0,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    podcast.toggleLike();
                                                  });
                                                },
                                                child: Icon(
                                                  podcast.liked
                                                      ? Icons.thumb_up
                                                      : Icons
                                                          .thumb_up_off_alt_outlined,
                                                  size: 16,
                                                  color: kTextColor,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                formatNumber(podcast.users!),
                                                style: const TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: kTextColor,
                                                ),
                                              ),
                                              const Icon(
                                                Icons.person,
                                                size: 13,
                                                color: kTextColor,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String formatNumber(int number) {
  if (number >= 1000) {
    // If the number is 1000 or greater, format it as x.yk
    final formattedNumber = NumberFormat.compact().format(number);
    return formattedNumber;
  } else {
    // If the number is less than 1000, simply convert it to a string
    return number.toString();
  }
}
