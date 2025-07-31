import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:movie_app/models/actors_model.dart';
import 'package:movie_app/screens/home_screen/home_screen_cubit/cubit.dart';
import 'package:movie_app/screens/home_screen/home_screen_cubit/states.dart';

class ListViewOfActors extends StatelessWidget {
  ListViewOfActors({super.key, this.model, this.title, this.heightOfImage, this.textSize, this.isRated, this.widthOfImage, this.heightOfListView});


  String? title;
  double? heightOfImage;
  double? widthOfImage;
  double? heightOfListView;
  double? textSize;
  bool? isRated = true;

  List<CastModel>? model;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
        builder: (BuildContext context, state) => Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 25,
            children: [
              Text(
                title!,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: heightOfListView,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => itemBuilder(model![index], context),
                  separatorBuilder: (context, index) => SizedBox(width: 20,),
                  itemCount: model!.length,
                ),
              ),
            ],
          ),
        ),
        listener: (BuildContext context, state) {  },
    );
  }

  Widget itemBuilder(model, context) =>  SizedBox(
    width: widthOfImage,
    child: Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        model.profile_path == null ? SizedBox(
          width: 108,
          height: 108,
        ) : Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
          child: Image(
            image: NetworkImage("https://image.tmdb.org/t/p/w500/${model.profile_path}",),
            width: widthOfImage,
            height: heightOfImage,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          overflow: TextOverflow.ellipsis,
          "${model.name}",
          style: TextStyle(
            color: HexColor("#FFFFFF"),
            fontWeight: FontWeight.w700,
            fontSize: textSize,
          ),
        ),
        Text(
          overflow: TextOverflow.ellipsis,
          "${model.character}",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
        isRated! ? SizedBox(
          child: RatingBar.builder(
            itemSize: 24,
            initialRating: 3.5,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: HexColor("#FFFF00"),
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
        ) : SizedBox(),
      ],
    ),
  );

}
