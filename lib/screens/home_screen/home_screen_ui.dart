import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_app/screens/home_screen/home_screen_cubit/cubit.dart';
import 'package:movie_app/screens/home_screen/home_screen_cubit/states.dart';
import 'package:movie_app/screens/search_screen/search_screen.dart';
import 'package:movie_app/widgets/carousal_slider_item.dart';
import 'package:movie_app/widgets/list_view_of_genres.dart';
import 'package:movie_app/widgets/list_view_of_items.dart';
import '../../network/remote/end_points.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
      listener: (context, state) => {},
        builder: (context, state) => Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 12,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage("https://ichef.bbci.co.uk/ace/standard/976/cpsprodpb/14235/production/_100058428_mediaitem100058424.jpg"),
                          radius: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome back",
                              style: TextStyle(
                                color: HexColor("#B9C1D9"),
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "Fatma Mamdouh",
                              style: TextStyle(
                                  color: HexColor("#FFFFFF"),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.menu_open,
                          color: HexColor("#B9C1D9"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 345,
                      height: 48,
                      color: HexColor("#131316"),
                      child: TextFormField(
                        onTap: ()
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SearchScreen()),);
                        },
                        controller: HomeScreenCubit.get(context).searchController,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 60),
                      child: CarouselSlider(
                          items: HomeScreenCubit.get(context).topRatedMovies.map(
                                (element) {
                              return Builder(
                                builder: (context) => carousalSliderItemBuilder(element),
                              );
                            },
                          ).toList(),
                          options: CarouselOptions(
                            height: 154,
                            aspectRatio: 16/9,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                            scrollDirection: Axis.horizontal,
                          )
                      ),
                    ),
                    ListViewOfGenres(
                      rated: false,
                    ),
                    ListViewOfItems(
                      model: HomeScreenCubit.get(context).nowPlayingMovies,
                      heightOfImage: 217,
                      widthOfImage: 150,
                      heightOfListView: 295,
                      title: "Now Playing Movies",
                      isRated: true,
                      textSize: 14,
                    ),
                    ListViewOfItems(
                      model: HomeScreenCubit.get(context).trendingMovies,
                      heightOfImage: 217,
                      widthOfImage: 150,
                      heightOfListView: 295,
                      title: "Trending Movies",
                      isRated: true,
                      textSize: 14,
                    ),
                    ListViewOfItems(
                      model: HomeScreenCubit.get(context).upomingMovies,
                      heightOfImage: 217,
                      widthOfImage: 150,
                      heightOfListView: 295,
                      title: "Upcoming Movies",
                      isRated: false,
                      textSize: 14,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}
