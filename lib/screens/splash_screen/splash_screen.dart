import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:movie_app/screens/home_screen/home_screen_cubit/cubit.dart';
import 'package:movie_app/screens/home_screen/home_screen_cubit/states.dart';
import 'package:movie_app/screens/home_screen/home_screen_ui.dart';

import '../../network/remote/end_points.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
      builder: (BuildContext context, state) => Scaffold(
        body: Stack(
          children: [
            Image(
              image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZuwZFC24iKm8NzkyQztX2p2-yYJpHwWQfTw&s"),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome To CineView ",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Catch your tavorite flicks.",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: ()
                    {
                      HomeScreenCubit.get(context).getTrendingMoviesData(TRENDINGMOVIES);
                      HomeScreenCubit.get(context).getTrendingMoviesData(NOWPLAYINGMOVIES);
                      HomeScreenCubit.get(context).getTrendingMoviesData(UPCOMINGMOVIES);
                      HomeScreenCubit.get(context).getTrendingMoviesData(TOPRATEDMOVIES);
                      HomeScreenCubit.get(context).getSpecialization();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen()),
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 38,
                      child: CircleAvatar(
                        backgroundColor: HexColor("#976504"),
                        radius: 35,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 28,
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
      listener: (BuildContext context, state) => {},
    );
  }
}
