import 'package:flutter/material.dart';
import 'package:troca_conhecimento/models/movie_model.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final moviesList = [
    MovieModel.fromJson({
      "adult": false,
      "backdrop_path": "/9yBVqNruk6Ykrwc32qrK2TIE5xw.jpg",
      "genre_ids": [28, 14, 12],
      "id": 460465,
      "original_language": "en",
      "original_title": "Mortal Kombat",
      "overview":
          "Nova aventura baseada no videogame Mortal Kombat. Na história, um jovem que nunca treinou artes marciais acaba envolvido em um gigantesco torneio de luta envolvendo guerreiros da Terra e lutadores e outras dimensões.",
      "popularity": 1028.395,
      "poster_path": "/ijvC2w2yANsfgLT3LMu2zFr0fxh.jpg",
      "release_date": "2021-04-07",
      "title": "Mortal Kombat",
      "video": false,
      "vote_average": 7.5,
      "vote_count": 3364
    })
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: moviesList.length,
            itemBuilder: (BuildContext context, int index) {
              return 
            }),
      ),
    );
  }
}
