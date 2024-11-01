import 'package:flutter/material.dart';

import 'package:movieflix/detail_screen.dart';
import 'package:movieflix/service/api_service.dart';
import 'package:movieflix/models/movie_popular.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<List<MoviePopular>> popMovies = ApiService.getPopMovies();
  final Future<List<MoviePopular>> nowMovies = ApiService.getNowMovies();
  final Future<List<MoviePopular>> comingMovies = ApiService.getComingMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Popular Movies",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            FutureBuilder(
              future: popMovies,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      height: 200, // 이미지의 높이를 지정하여 레이아웃을 더 안정적으로 만듦
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    id: snapshot.data![index].id,
                                    img: snapshot.data![index].posterPath,
                                  ),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500${snapshot.data![index].backdropPath}',
                                width: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 20,
                        ),
                      ),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Now in Cinema",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            FutureBuilder(
              future: nowMovies,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      height: 240,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    id: snapshot.data![index].id,
                                    img: snapshot.data![index].posterPath,
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w500${snapshot.data![index].posterPath}',
                                    width: 160,
                                    height: 180,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 160,
                                  child: Text(
                                    snapshot.data![index].originalTitle.length >
                                            30
                                        ? '${snapshot.data![index].originalTitle.substring(0, 30)}...'
                                        : snapshot.data![index].originalTitle,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 20,
                        ),
                      ),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Coming soon",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            FutureBuilder(
              future: comingMovies,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      height: 240,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    id: snapshot.data![index].id,
                                    img: snapshot.data![index].posterPath,
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w500${snapshot.data![index].posterPath}',
                                    width: 160,
                                    height: 180,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 160,
                                  child: Text(
                                    snapshot.data![index].originalTitle.length >
                                            30
                                        ? '${snapshot.data![index].originalTitle.substring(0, 30)}...'
                                        : snapshot.data![index].originalTitle,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 20,
                        ),
                      ),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
