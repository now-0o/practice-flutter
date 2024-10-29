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
    int nextDay = DateTime(now.year, now.month, now.day + 1).day;
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
                '요일 날짜',
                style: TextStyle(
                  color: Color(0xfff0f0f0),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
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
            ],
          ),
        ),
      ),
    );
  }
}
