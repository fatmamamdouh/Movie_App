import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:movie_app/screens/home_screen/home_screen_cubit/cubit.dart';
import 'package:movie_app/screens/home_screen/home_screen_cubit/states.dart';
import 'package:movie_app/widgets/list_view_of_actors.dart';
import 'package:movie_app/widgets/list_view_of_items.dart';

import '../../models/movie_details_model.dart';
import '../../models/trending_movies.dart';
import '../../widgets/icon_of_movie_details.dart';
import '../../widgets/play_video_icon.dart';
import '../web_view_screen/web_view_screen.dart';

class MovieDetailsScreen extends StatelessWidget {
  MovieDetailsScreen({super.key, this.model});

  MovieDetailsModel? model;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
        builder: (BuildContext context, state) => Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 470,
                  child: Stack(
                    children: [
                      Image(
                        image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500/${model!.poster_path}",
                        ),
                        width: double.infinity,
                        height: 470,
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: PlayVideoIcon(
                          playIconColor: Colors.black,
                          radius: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Row(
                        children: [
                          Iconofmoviedetals(
                            rated: false,
                            contentText: model!.adult == false ? "+18" : "+6",
                          ),
                          Iconofmoviedetals(
                            rated: false,
                            contentText: "${model!.genres![0].name}}",
                          ),
                          Iconofmoviedetals(
                            rated: true,
                            contentText: "${model!.vote_average}",
                          ),
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.favorite_outline_outlined,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${model!.title}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            "${model!.release_date}",
                            style: TextStyle(
                              color: HexColor("#A96FD6"),
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "${model!.runtime} min",
                            style: TextStyle(
                              color: HexColor("#A96FD6"),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Overview",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        "${model!.overview}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      ListViewOfActors(
                        model: HomeScreenCubit.get(context).cast,
                        textSize: 16,
                        isRated: false,
                        title: "Actors",
                        heightOfImage: 108,
                        widthOfImage: 108,
                        heightOfListView: 180,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: HexColor("#F5C518"),
                        ),
                        width: double.infinity,
                        child: TextButton(
                          onPressed: ()
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TrailerWebView(
                                  url: '${model!.homepage}',
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Open IMDb",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        listener: (BuildContext context, state) {  },);
  }
}
