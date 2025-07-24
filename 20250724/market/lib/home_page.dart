import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff16171e),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/icons/menu.png'),
                Row(
                  children: [
                    Image.asset('assets/icons/search.png'),
                    SizedBox(width: 16),
                    Image.asset('assets/icons/user.png'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 26),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Smartphone",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 24),
                    Text(
                      'Headset',
                      style: TextStyle(
                        color: Color(0xff999999),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 24),
                    Text(
                      'Earphone',
                      style: TextStyle(
                        color: Color(0xff999999),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 34),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 8),
                        Text(
                          "브랜드 선택",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 64,
                          height: 72,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            color: Color(0xff242534),
                          ),
                          child: Center(
                            child: Text(
                              "All",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
