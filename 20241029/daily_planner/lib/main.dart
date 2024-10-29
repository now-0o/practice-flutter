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
  List<int> days = [];

  @override
  void initState() {
    super.initState();
    _calculateDays();
  }

  void _calculateDays() {
    DateTime now = DateTime.now();
    //int nextDay = DateTime(now.year, now.month, now.day + 1).day;
    int nextDay = 17;
    int lastDay = DateTime(now.year, now.month + 1, 0).day;

    days = List.generate(lastDay - nextDay + 1, (index) => nextDay + index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff1f1f1f),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 50,
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 50,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'MONDAY 16',
                style: TextStyle(
                  color: Color(0xfff0f0f0),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'TODAY',
                    style: TextStyle(
                      color: Color(0xfffefefe),
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    '·',
                    style: TextStyle(
                      color: Color(0xffb22580),
                      fontSize: 60,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: days.isEmpty
                        ? const Center(
                            child: Text(
                              'No date data',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 100, // 고정된 높이 설정
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: days.length,
                              itemBuilder: (context, index) {
                                return Center(
                                  child: Text(
                                    '${days[index]}',
                                    style: const TextStyle(
                                      color: Color(0xff8f8f8f),
                                      fontSize: 50,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 20),
                            ),
                          ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color(0xfffef754),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  Text(
                                    '11',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -2,
                                      height: 0.8,
                                    ),
                                  ),
                                  Text(
                                    '30',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '|',
                                    style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.w100,
                                      height: 0.8,
                                    ),
                                  ),
                                  Text(
                                    '12',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '20',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      height: 0.8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'DESIGN',
                                  style: TextStyle(
                                    fontSize: 64,
                                    fontWeight: FontWeight.w500,
                                    height: 0.6,
                                  ),
                                ),
                                Text(
                                  'MEETING',
                                  style: TextStyle(
                                    fontSize: 64,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 80,
                          ),
                          Text(
                            'ALEX',
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'HELENA',
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'NANA',
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color(0xff9c6bce),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  Text(
                                    '12',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                      height: 0.8,
                                    ),
                                  ),
                                  Text(
                                    '35',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '|',
                                    style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.w100,
                                      height: 0.8,
                                    ),
                                  ),
                                  Text(
                                    '14',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '10',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      height: 0.8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'DAILY',
                                  style: TextStyle(
                                    fontSize: 64,
                                    fontWeight: FontWeight.w500,
                                    height: 0.6,
                                  ),
                                ),
                                Text(
                                  'PROJECT',
                                  style: TextStyle(
                                    fontSize: 64,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 80,
                          ),
                          Text(
                            'ME',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'RICHARD',
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'CIRY',
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color(0xffbcee4b),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  Text(
                                    '15',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                      height: 0.8,
                                    ),
                                  ),
                                  Text(
                                    '00',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '|',
                                    style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.w100,
                                      height: 0.8,
                                    ),
                                  ),
                                  Text(
                                    '16',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '30',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      height: 0.8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'WEEKLY',
                                  style: TextStyle(
                                    fontSize: 64,
                                    fontWeight: FontWeight.w500,
                                    height: 0.6,
                                  ),
                                ),
                                Text(
                                  'PLANNER',
                                  style: TextStyle(
                                    fontSize: 64,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 80,
                          ),
                          Text(
                            'DEN',
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'NANA',
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'MARK',
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
