import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:movie_app/models/specialization_model.dart';
import 'package:movie_app/screens/home_screen/home_screen_cubit/cubit.dart';
import 'package:movie_app/screens/home_screen/home_screen_cubit/states.dart';

class ListViewOfGenres extends StatelessWidget {
  ListViewOfGenres({super.key, this.rated});

  bool? rated;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
      builder: (BuildContext context, state) => Padding(
        padding: const EdgeInsets.only(
          bottom: 30
        ),
        child: SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => genresItemBuilder(HomeScreenCubit.get(context).specialization[index]),
            separatorBuilder: (context, index) => SizedBox(width: 20,),
            itemCount: HomeScreenCubit.get(context).specialization.length,
          ),
        ),
      ),
      listener: (BuildContext context, state) => {},
    );
  }


  Widget genresItemBuilder(model) => Container(
    width: 110,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: HexColor("#A96FD6"),
    ),
    child: Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
        top: 8,
        left: 15,
        right: 15,
      ),
      child: Row(
        children: [
          rated! ? Row(
            children: [
              Icon(
                Icons.star,
                color: HexColor("#FFFF00"),
              ),
              SizedBox(width: 3,),
            ],
          ) : SizedBox(),
          Expanded(
            child: Center(
              child: Text(
                overflow: TextOverflow.ellipsis,
                "${model.name}",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: HexColor("#FFFFFF")
                ),),
            ),
          ),
        ],
      ),
    ),
  );
}
