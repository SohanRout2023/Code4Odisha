import 'package:code4odisha/buttons/circle.dart';
import 'package:code4odisha/buttons/mediumcircle.dart';
import 'package:code4odisha/buttons/dot.dart';
import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';

class progression extends StatefulWidget {
  const progression({super.key});

  @override
  State<progression> createState() => progressionState();
}

class progressionState extends State<progression> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(minutes: 120),
            builder: ((context, value, child) {
              return Container(
                width: 100,
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                    width: double.infinity,
                    child: Stack(
                      children: <Widget>[
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Center(
                            child: SlideCountdown(
                              duration: Duration(minutes: 120),
                              slideDirection: SlideDirection.up,
                              separator: ':',
                              padding: EdgeInsets.all(16),
                              textStyle: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 217, 110, 4)),
                              separatorStyle: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 217, 110, 4)),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 12, 12, 12),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(
                                Icons.live_tv_outlined,
                                color: Colors.red,
                              ),
                              Text(
                                "LIVE",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ShaderMask(
                          shaderCallback: (Rect) {
                            return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [value, value],
                              colors: [
                                Colors.orange.shade300,
                                Colors.grey.withAlpha(55)
                              ],
                            ).createShader(Rect);
                          },
                          child: Center(
                            child: Column(
                              children: const <Widget>[
                                SizedBox(
                                  height: 100,
                                ),
                                Text(
                                  'Start',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 250, 249, 249),
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                MediumCircle(),
                                SizedBox(
                                  height: 10,
                                ),
                                Circle(),
                                SizedBox(
                                  height: 10,
                                ),
                                MediumCircle(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                MediumCircle(),
                                SizedBox(
                                  height: 10,
                                ),
                                Circle(),
                                SizedBox(
                                  height: 10,
                                ),
                                MediumCircle(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                MediumCircle(),
                                SizedBox(
                                  height: 10,
                                ),
                                Circle(),
                                SizedBox(
                                  height: 10,
                                ),
                                MediumCircle(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                MediumCircle(),
                                SizedBox(
                                  height: 10,
                                ),
                                Circle(),
                                SizedBox(
                                  height: 10,
                                ),
                                MediumCircle(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                MediumCircle(),
                                SizedBox(
                                  height: 10,
                                ),
                                Circle(),
                                SizedBox(
                                  height: 10,
                                ),
                                MediumCircle(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                MediumCircle(),
                                SizedBox(
                                  height: 10,
                                ),
                                Circle(),
                                SizedBox(
                                  height: 10,
                                ),
                                MediumCircle(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                MediumCircle(),
                                SizedBox(
                                  height: 10,
                                ),
                                Circle(),
                                SizedBox(
                                  height: 10,
                                ),
                                MediumCircle(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                MediumCircle(),
                                SizedBox(
                                  height: 10,
                                ),
                                Circle(),
                                SizedBox(
                                  height: 10,
                                ),
                                MediumCircle(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                MediumCircle(),
                                SizedBox(
                                  height: 10,
                                ),
                                Circle(),
                                SizedBox(
                                  height: 10,
                                ),
                                MediumCircle(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                MediumCircle(),
                                SizedBox(
                                  height: 10,
                                ),
                                Circle(),
                                SizedBox(
                                  height: 10,
                                ),
                                MediumCircle(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                MediumCircle(),
                                SizedBox(
                                  height: 10,
                                ),
                                Circle(),
                                SizedBox(
                                  height: 10,
                                ),
                                MediumCircle(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 10,
                                ),
                                MediumCircle(),
                                SizedBox(
                                  height: 10,
                                ),
                                Circle(),
                                SizedBox(
                                  height: 10,
                                ),
                                MediumCircle(),
                                SizedBox(
                                  height: 10,
                                ),
                                dots(),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'Thank You !',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 250, 249, 249),
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
