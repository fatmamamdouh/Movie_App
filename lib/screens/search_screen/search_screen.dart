import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:movie_app/screens/home_screen/home_screen_cubit/states.dart';

import '../home_screen/home_screen_cubit/cubit.dart';
import '../movie_details_screen/movie_details_screen_ui.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
        builder: (BuildContext context, state) => Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                spacing: 20,
                children: [
                  TextFormField(
                    onChanged: (value)
                    {
                      HomeScreenCubit.get(context).getSearchingMoviesData(value);
                    },
                    controller: HomeScreenCubit.get(context).searchController,
                    style: TextStyle(
                      color: Colors.white
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          gapPadding: 12
                      ),
                      hint: Text(
                        "Search",
                        style: TextStyle(
                          fontSize: 16,
                          color: HexColor("#575B66"),
                        ),),
                      prefixIcon: Icon(
                        Icons.search_sharp,
                        color: HexColor("#B9C1D9"),
                      ),
                      suffixIcon: Icon(
                        Icons.filter_list_outlined,
                        color: HexColor("#B9C1D9"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => searchItemBuilder(HomeScreenCubit.get(context).searchMovies[index], context),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                        ),
                        itemCount: HomeScreenCubit.get(context).searchMovies.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        listener: (BuildContext context, state) {  },);
  }

  Widget searchItemBuilder(model, context) => GestureDetector(
    onTap: ()
    {
      HomeScreenCubit.get(context).getMovieDetails(model.id);
      HomeScreenCubit.get(context).getActorCast(model.id);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MovieDetailsScreen(
          model: HomeScreenCubit.get(context).movieDetails,
        )),
      );

    },
    child: Row(
      children: [
        model.poster_path == null ? SizedBox(
          width: 110,
          height: 110,
        ) : Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
          child: Image(
            image: NetworkImage("https://image.tmdb.org/t/p/w500/${model.poster_path}",),
            width: 110,
            height: 110,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 20,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                overflow: TextOverflow.ellipsis,
                "${model.title}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                "${model.overview}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                "${model.release_date}",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
