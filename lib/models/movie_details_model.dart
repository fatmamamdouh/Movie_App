import 'package:movie_app/models/specialization_model.dart';

class MovieDetailsModel
{
  bool? adult;
  List<GenreModel>? genres;
  int? id;
  String? imdb_id;
  String? overview;
  String? original_title;
  String? release_date;
  String? poster_path;
  String? homepage;
  String? title;
  double? popularity;
  int? runtime;
  double? vote_average;

  MovieDetailsModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    adult = json['adult'];
    imdb_id = json['imdb_id'];
    overview = json['overview'];
    original_title = json['original_title'];
    release_date = json['release_date'];
    poster_path = json['poster_path'];
    title = json['title'];
    popularity = json['popularity'];
    runtime = json['runtime'];
    homepage = json['homepage'];
    vote_average = json['vote_average'];

    genres = (json['genres'] as List<dynamic>).map(
          (e)
      {
        return GenreModel.fromJson(e);
      },
    ).toList();

  }
}