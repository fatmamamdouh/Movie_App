class SpecializationModel
{
  List<GenreModel>? genres;

  SpecializationModel.fromJson(Map<String, dynamic> json)
  {
    genres = (json['genres'] as List<dynamic>).map(
          (e)
      {
        return GenreModel.fromJson(e);
      },
    ).toList();
  }
}


class GenreModel
{
  int? id;
  String? name;

  GenreModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    name = json['name'];
  }
}