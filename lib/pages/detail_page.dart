import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:troca_conhecimento/constants/tmdb_endpoints.dart';
import 'package:troca_conhecimento/models/movie_model.dart';

class DetailPage extends StatefulWidget {
  final MovieModel movie;
  const DetailPage({Key? key, required this.movie}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.dstIn,
            ),
            image: new NetworkImage(
              TmdbEndpoints.imageUrlBase + widget.movie.posterPath!,
            ),
          ),
        ),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(1),
                  ],
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 180,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Hero(
                          tag: widget.movie.id!,
                          child: CachedNetworkImage(
                            imageUrl: TmdbEndpoints.imageUrlBase +
                                widget.movie.posterPath!,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        widget.movie.title!,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        widget.movie.originalTitle!,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Sinopse",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        widget.movie.overview!,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
