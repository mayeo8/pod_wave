import 'dart:ui';

import 'package:pod_wave/podcast.dart';

List<Podcast> getForYouPodcast = [
  Podcast(
      image: 'assets/images/you1.png',
      title: 'How to hack the education system?',
      likes: 27,
      date: '6 Dec',
      length: '1 hr 15 min',
      chanel: 'tech talk',
      author: 'Alex Smith'),
  Podcast(
      image: 'assets/images/you2.png',
      title: 'How to hack the education system?',
      likes: 27,
      date: '6 Dec',
      length: '1 hr 15 min',
      chanel: 'mind matters',
      author: 'Emily Lee'),
];

List<Podcast> getRecommendedPodcast = [
  Podcast(
    image: 'assets/images/rec1.png',
    title: 'Sleep sounds by nature',
    likes: 127000,
    users: 1200,
    chanel: 'book worm',
    author: 'David Wright',
  ),
  Podcast(
    image: 'assets/images/rec2.png',
    title: 'Cover',
    likes: 87000,
    users: 2100,
    chanel: 'health now',
    author: 'Sarah Brown',
  ),
];
List<Color> recommendedColor = [
  const Color(0xFFCEEDFF),
  const Color(0xFFEBE8FF),
];
List<Podcast> getSubscribedPodcast = [
  Podcast(
    image: 'assets/images/sub3.png',
    title: 'Easy Stories in English',
    chanel: 'game on',
    author: 'John Taylor',
  ),
  Podcast(
    image: 'assets/images/sub1.png',
    title: 'World Business Report',
    chanel: 'bizbuzz',
    author: 'Olivia Clark',
  ),
  Podcast(
    image: 'assets/images/sub2.jpg',
    title: 'The Debrief',
    chanel: 'daily dose',
    author: 'Michael King',
  ),
];

Podcast middlePod = Podcast(
  image: 'assets/images/middle.png',
  title: 'How to avoid burnout at work?',
  date: '5 Dec',
  length: '45 min',
  chanel: 'live better',
  author: 'Daniel Parker',
);
