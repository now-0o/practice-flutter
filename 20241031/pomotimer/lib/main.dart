import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int selectedIndex = -1;
  int min = 5;
  int second = 0;
  int round = 0;
  int goal = 0;

  bool isRunning = false;

  @override
  void initState() {
    super.initState();

    selectedIndex = 1;
    min = min * (selectedIndex + 1);
    setState(() {});
  }

  late Timer timer;

  void onTick(Timer timer) {
    if (min == 0 && second == 0) {
      setState(() {
        round++;
        if (round == 4) {
          round = 0;
          goal++;
        }
        isRunning = false;
        min = 5 * (selectedIndex + 1);
      });
      timer.cancel();
    } else if (min != 0 && second == 0) {
      setState(() {
        second = 59;
        min--;
      });
    } else {
      setState(() {
        second--;
      });
    }
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      if (min == 5 * (selectedIndex + 1)) {
        min--;
        second = 59;
      }
      isRunning = true;
    });
  }

  void onStop() {
    timer.cancel();
    setState(() {
      isRunning = false;
      min = 5 * (selectedIndex + 1);
      second = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffe64d3d),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "POMOTIMER",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 160,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  timeCard(
                    count: min,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    ":",
                    style: TextStyle(
                      fontSize: 80,
                      color: Colors.white54,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  timeCard(
                    count: second,
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                height: 60,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.white,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.white,
                      ],
                      stops: [0.0, 0.1, 0.9, 1.0],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstOut,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      int number = 5 * (index + 1); // 5, 10, 15, ... , 60
                      bool isSelected = selectedIndex == index;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            min = 5 * (selectedIndex + 1);
                            second = 0;
                            isRunning = false;
                            onStop();
                          });
                        },
                        child: Container(
                          width: 80,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                isSelected ? Colors.white : Colors.transparent,
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 255, 255, 255)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '$number',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: isSelected
                                  ? const Color(0xffe64d3d)
                                  : const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: IconButton(
                  onPressed: () {
                    isRunning ? onPausePressed() : onStartPressed();
                  },
                  icon: Icon(
                    size: 120,
                    color: Colors.white70,
                    isRunning ? Icons.pause_circle : Icons.play_circle_fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '$round/4',
                          style: const TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                          ),
                        ),
                        const Text(
                          "ROUND",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '$goal/12',
                          style: const TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                          ),
                        ),
                        const Text(
                          "GOAL",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class timeCard extends StatefulWidget {
  final int count;

  const timeCard({
    super.key,
    required this.count,
  });

  @override
  State<timeCard> createState() => _timeCardState();
}

class _timeCardState extends State<timeCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // 맨 뒤 작은 반투명 박스
        Transform.translate(
          offset: const Offset(0, -16),
          child: Container(
            width: 140,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        // 중간 크기의 반투명 박스
        Transform.translate(
          offset: const Offset(0, -8),
          child: Container(
            width: 150,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        // 맨 앞 불투명 박스
        Container(
          width: 160,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              widget.count >= 10 ? '${widget.count}' : '0${widget.count}',
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE64A38),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
