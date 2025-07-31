import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:movie_app/widgets/play_video_icon.dart';




Widget carousalSliderItemBuilder(model) => SizedBox(
  width: 345,
  height: 154,
  child: Stack(
    children: [
      Image(
        image: NetworkImage("https://image.tmdb.org/t/p/w500/${model.poster_path}"),
        width: 345,
        height: 154,
        fit: BoxFit.cover,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    "${model.title}",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: HexColor("#FFFFFF"),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: HexColor("#FFFF00"),
                    ),
                    Text(
                      "${model.vote_average}",
                      style: TextStyle(
                        color: HexColor("#FFFFFF"),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              "Drama, Horror, Mystery & Thriller",
              style: TextStyle(
                color: HexColor("#FFFFFF"),
                fontSize: 12,
              ),
            ),
            Text(
              "${model.release_date}",
              style: TextStyle(
                color: HexColor("#FFFFFF"),
                fontSize: 12,
              ),
            ),
            Spacer(),
            Row(
              children: [
                Text(
                  "${model.popularity} views, ${model.original_language}",
                  style: TextStyle(
                    fontSize: 12,
                    color: HexColor("#FFFFFF"),
                  ),
                ),
                Spacer(),
                PlayVideoIcon(
                  playIconColor: Colors.white,
                  radius: 17.5,
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  ),
);