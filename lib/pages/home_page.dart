import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:troca_conhecimento/constants/tmdb_endpoints.dart';
import 'package:troca_conhecimento/controllers/movie_controller.dart';
import 'package:troca_conhecimento/pages/detail_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = MovieController();

  @override
  void initState() {
    super.initState();
    initMovieList();
  }

  Future<void> initMovieList() async {
    await controller.getMostPopularMovies();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.black,
        child: ListView.builder(
            itemCount: controller.moviesList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Container(
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3)),
                              child: Hero(
                                tag: controller.moviesList[index].id!,
                                child: CachedNetworkImage(
                                  imageUrl: TmdbEndpoints.imageUrlBase +
                                      controller.moviesList[index].posterPath!,
                                  placeholder: (context, url) => SizedBox(
                                    width: 200,
                                    height: 100,
                                    child: CircularProgressIndicator.adaptive(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.moviesList[index].title!,
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                  Text(
                                    controller.moviesList[index].originalTitle!,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                    maxLines: 1,
                                    overflow: TextOverflow.fade,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Popularity: ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      Text(
                                        controller.moviesList[index].popularity!
                                            .round()
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Votos: ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          Text(
                                            controller
                                                .moviesList[index].voteCount!
                                                .round()
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Média: ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          Text(
                                            controller
                                                .moviesList[index].voteAverage!
                                                .round()
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    controller.moviesList[index].overview!,
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                    maxLines: 4,
                                    overflow: TextOverflow.fade,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          movie: controller.moviesList[index],
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
