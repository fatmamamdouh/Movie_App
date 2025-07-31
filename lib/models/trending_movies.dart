class TrendingMoviesModel
{
  int? page;
  List<ResultsModel>? results;

  TrendingMoviesModel.fromJson(Map<String, dynamic> json)
  {
    page = json['page'];
    results = (json['results'] as List<dynamic>).map(
            (e)
        {
          return ResultsModel.fromJson(e);
        },
    ).toList();
  }
}

class ResultsModel
{
  String? backdrop_path;
  int? id;
  String? originalTitle;
  String? title;
  String? overview;
  String? original_language;
  String? poster_path;
  String? media_type;
  double? popularity;
  String? release_date;
  double? vote_average;

  ResultsModel.fromJson(Map<String, dynamic> json)
  {
    backdrop_path = json['backdrop_path'];
    id = json['id'];
    originalTitle = json['original_title'];
    title = json['title'];
    overview = json['overview'];
    original_language = json['original_language'];
    popularity = json['popularity'];
    poster_path = json['poster_path'];
    media_type = json['media_type'];
    release_date = json['release_date'];
    vote_average = json['vote_average'];
  }
}