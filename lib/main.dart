import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:movie_app/network/remote/dio_helper.dart';
import 'package:movie_app/screens/home_screen/home_screen_cubit/cubit.dart';
import 'package:movie_app/screens/home_screen/home_screen_cubit/states.dart';
import 'package:movie_app/screens/home_screen/home_screen_ui.dart';
import 'package:movie_app/screens/movie_details_screen/movie_details_screen_ui.dart';
import 'package:movie_app/screens/splash_screen/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeScreenCubit(),
      child: BlocConsumer<HomeScreenCubit, HomeScreenStates>(
        builder: (BuildContext context, state) => MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: HexColor("#1F1F29"),
          ),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
        listener: (BuildContext context, state) => {},
      ),
    );
  }
}