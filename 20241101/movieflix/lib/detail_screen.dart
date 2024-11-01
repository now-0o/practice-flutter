import 'package:flutter/material.dart';
import 'package:movieflix/service/api_service.dart';
import 'package:movieflix/models/movie_detail.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  final String img;

  const DetailScreen({
    super.key,
    required this.id,
    required this.img,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late final Future<MovieDetail> detailInfo;

  @override
  void initState() {
    super.initState();
    detailInfo = ApiService.getDetailInfo(widget.id);
  }

  Widget buildStars(double voteAverage) {
    int starCount = (voteAverage / 2).round().clamp(0, 5);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          size: 30,
          Icons.star_rounded,
          color:
              index < starCount ? Colors.yellow : Colors.grey.withOpacity(.4),
        );
      }),
    );
  }

  String formatRuntime(int runtime) {
    final hours = runtime ~/ 60;
    final minutes = runtime % 60;
    return '${hours}h ${minutes}min';
  }

  String formatGenres(List<Genre> genres) {
    return genres.map((genre) => genre.name).join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Back to List",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://image.tmdb.org/t/p/w500${widget.img}'),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder(
          future: detailInfo,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final movie = snapshot.data!;
              return SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end, // 아래쪽 정렬
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.originalTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      buildStars(movie.vote),
                      const SizedBox(height: 20),
                      Text(
                        '${formatRuntime(movie.runtime)} | ${formatGenres(movie.genres)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Storyline",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        snapshot.data!.overview,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xfff7d749),
                            borderRadius:
                                BorderRadius.circular(15), // 둥근 모서리 설정
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 100,
                            ),
                            child: Text(
                              "Buy ticket",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
