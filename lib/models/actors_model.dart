class ActorsModel
{
  int? id;
  List<CastModel>? cast;

  ActorsModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];

    cast = (json['cast'] as List<dynamic>).map(
          (e)
      {
        return CastModel.fromJson(e);
      },
    ).toList();

  }
}


class CastModel
{
  int? id;
  String? name;
  String? original_name;
  String? character;
  String? profile_path;

  CastModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    original_name = json['original_name'];
    character = json['character'];
    profile_path = json['profile_path'];
  }
}