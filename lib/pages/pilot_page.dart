import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:troca_conhecimento/pages/detail_page_concept.dart';

class PilotPage extends StatefulWidget {
  final String title;
  const PilotPage({Key? key, required this.title}) : super(key: key);

  @override
  _PilotPageState createState() => _PilotPageState();
}

class _PilotPageState extends State<PilotPage> {
  final String tmdbImageEndpoint = "https://image.tmdb.org/t/p/w500";
  final String tmdbMoviesEndpoint =
      "https://api.themoviedb.org/3/movie/popular";
  List<Map<String, dynamic>> movieList = [];
  bool isLoading = true;

  Future<void> initMovieList() async {
    List<Map<String, dynamic>> list = [];
    var response = await http.get(
      Uri.parse(
          "https://api.themoviedb.org/3/movie/popular?api_key=f54e8290a68bc80dbcf2bdb116162051&language=pt-BR"),
    );

    if (response.statusCode == 200) {
      var jsonResult = jsonDecode(response.body);

      setState(() {
        movieList = List<Map<String, dynamic>>.from(
            jsonResult['results'].map((e) => e));
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.black,
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: movieList.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPageConcept(
                            movie: movieList[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Hero(
                              tag: movieList[index]['id'],
                              child: CachedNetworkImage(
                                imageUrl:
                                    "$tmdbImageEndpoint${movieList[index]['poster_path']}",
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movieList[index]['title'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    movieList[index]['original_title'],
                                    style: TextStyle(
                                      color: Colors.white38,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Popularidade: ${(movieList[index]['popularity'] as double).round()}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    "Votos: ${movieList[index]['vote_count']}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "${movieList[index]['overview']}",
                                    style: TextStyle(
                                      color: Colors.white38,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200,
                                    ),
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            flex: 2,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
