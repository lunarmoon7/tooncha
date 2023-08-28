import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooncha/models/webtoon_detail_model.dart';
import 'package:tooncha/models/webtoon_episode_model.dart';
import 'package:tooncha/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scroll(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          foregroundColor: Colors.black87,
          backgroundColor: Colors.white,
          title: Text(
            widget.title,
            style: GoogleFonts.getFont(
              'Poor Story',
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: widget.id,
                  child: Container(
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 15,
                          offset: const Offset(5, 5),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      widget.thumb,
                      headers: const {
                        "User-Agent":
                            'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36'
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            FutureBuilder(
              future: webtoon,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          '${snapshot.data!.genre} / ${snapshot.data!.age}',
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  );
                }
                return const Text("...");
              },
            ),
            const SizedBox(
              height: 50,
            ),
            FutureBuilder(
              future: episodes,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      for (var episode in snapshot.data!) Text(episode.title),
                    ],
                  );
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
