import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:pod_wave/constants.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen(
      {super.key,
      required this.channel,
      required this.liked,
      required this.title,
      required this.author});

  static String id = 'player_Screen';
  final String channel;
  final bool liked;
  final String title;
  final String author;

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

double height = 0.0;
double begin = 0.0;
double end = 220.0;
double speed = 1;
bool control = true;
double forward = 15;
double backward = 15;
bool isDark = false;
double seekPosition = 0.0;
bool isPlaying = false;
Duration duration = const Duration();
Duration position = const Duration();
final player = AudioPlayer();

class _PlayerScreenState extends State<PlayerScreen> {
  void playAudio(String audioUrl) {
    player.play(AssetSource(audioUrl));

    player.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });

    player.onPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }

  void toggleAudio() {
    if (isPlaying) {
      player.pause();
      isPlaying = false;
    } else {
      playAudio('podcast/fallcameearly_aac_35793.m4a');
      isPlaying = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    player.onPlayerComplete.listen((event) {
      setState(() {
        control = true;
        isPlaying = false;
        position = const Duration(seconds: 0);
      });
    });
    var darkMode = isDark ? Colors.white : kHeadingColor;
    return SafeArea(
      child: Scaffold(
        backgroundColor: isDark ? kHeadingColor : kBackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 28.0, horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    color: darkMode,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Text(
                    widget.channel.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      color: darkMode,
                    ),
                  ),
                  const Icon(Icons.favorite_border_sharp),
                ],
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: const AssetImage('assets/images/icons/left.png'),
                      color: darkMode,
                    ),
                    Image(
                      image: const AssetImage('assets/images/icons/right.png'),
                      color: darkMode,
                    ),
                  ],
                ),
                const Center(
                  child: Image(
                    image: AssetImage('assets/images/icons/banner.png'),
                  ),
                ),
                Positioned(
                  left: 60.0,
                  top: 80.0,
                  child: SizedBox(
                    // height: 300.0,
                    width: 138,
                    child: Text(
                      widget.channel.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 54,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Rubik',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  right: 40.0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(12.0)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.thumb_up),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        fontFamily: 'NotoSans',
                        color: darkMode),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'by: ${widget.author}',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      color: darkMode,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: isDark
                          ? const Color(0xff343434)
                          : const Color(0xFFF2EFED),
                      activeTrackColor: kButtonColor,
                      thumbColor: kButtonColor,
                      overlayColor: const Color(0x29EB1555),
                      thumbShape: VerticalRectSliderThumbShape(
                          thumbHeight: 18.0,
                          thumbWidth: 5.0,
                          thumbRadius: 12.0),
                      overlayShape: VerticalRectSliderThumbShape(
                          thumbHeight: 18.0,
                          thumbWidth: 5.0,
                          thumbRadius: 12.0),
                    ),
                    child: Slider(
                      value: position.inSeconds.toDouble(),
                      min: begin,
                      max: duration.inSeconds.toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          player.seek(Duration(seconds: value.round()));
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${position.inMinutes}:${position.inSeconds.remainder(60)}',
                        style: TextStyle(
                          color: darkMode,
                        ),
                      ),
                      Text(
                        '${duration.inMinutes}:${duration.inSeconds.remainder(60)}',
                        style: TextStyle(
                          color: darkMode,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Text(
                            '${speed}x',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Inter',
                              color: darkMode,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              speed += 0.5;
                              if (speed >= 3) {
                                speed = 1;
                              }
                            });
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              // if (height == begin || begin < height) {
                              //   height = begin;
                              // } else {
                              //   height -= 15;
                              // }
                            });
                          },
                          child: Image(
                            image: const AssetImage(
                                'assets/images/icons/backward.png'),
                            width: 30,
                            height: 30.0,
                            color: darkMode,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              control = !control;
                              toggleAudio();
                            });
                          },
                          child: Image(
                            image: AssetImage(control
                                ? 'assets/images/icons/play.png'
                                : 'assets/images/icons/pause.png'),
                            width: 62,
                            height: 62.0,
                            color: darkMode,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              // if (height == end || end > height) {
                              //   height = end;
                              // } else {
                              //   height += forward;
                              // }
                            });
                          },
                          child: Image(
                            image: const AssetImage(
                                'assets/images/icons/forward.png'),
                            width: 30,
                            height: 30.0,
                            color: darkMode,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                isDark = !isDark;
                              });
                            },
                            child: Image(
                              image: const AssetImage(
                                  'assets/images/icons/moon.png'),
                              width: 30,
                              height: 30.0,
                              color: darkMode,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: const AssetImage('assets/images/icons/file.png'),
                        width: 28,
                        height: 28,
                        color: darkMode,
                      ),
                      SizedBox(
                        height: 10.0,
                        child: Image(
                          image: const AssetImage(
                              'assets/images/icons/option.png'),
                          width: 30,
                          height: 30.0,
                          color: darkMode,
                        ),
                      ),
                      Image(
                        image:
                            const AssetImage('assets/images/icons/upload.png'),
                        width: 28,
                        height: 28.0,
                        color: darkMode,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerticalRectSliderThumbShape extends SliderComponentShape {
  final double thumbHeight;
  final double thumbWidth;
  final double thumbRadius;

  VerticalRectSliderThumbShape(
      {this.thumbHeight = 8.0, this.thumbWidth = 2.0, this.thumbRadius = 4.0});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(thumbWidth, thumbHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double>? activationAnimation,
    Animation<double>? enableAnimation,
    required bool isDiscrete,
    TextPainter? labelPainter,
    RenderBox? parentBox,
    SliderThemeData? sliderTheme,
    TextDirection? textDirection,
    double? value,
    required double textScaleFactor,
    Size? sizeWithOverflow,
  }) {
    final canvas = context.canvas;

    final thumbRect = Rect.fromCenter(
      center: center,
      width: thumbWidth,
      height: thumbHeight,
    );

    final thumbPath = Path()
      ..addRRect(
          RRect.fromRectAndRadius(thumbRect, Radius.circular(thumbRadius)));

    final paint = Paint()
      ..color = sliderTheme?.thumbColor ?? Colors.blue
      ..style = PaintingStyle.fill;

    canvas.drawPath(thumbPath, paint);
  }
}
