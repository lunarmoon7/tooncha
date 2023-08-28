import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooncha/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;
  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: title,
              thumb: thumb,
              id: id,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
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
                thumb,
                headers: const {
                  "User-Agent":
                      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36'
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: GoogleFonts.getFont(
              'Poor Story',
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
