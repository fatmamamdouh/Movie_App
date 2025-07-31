const TRENDINGMOVIES = "trending/movie/day";
const NOWPLAYINGMOVIES = "movie/now_playing";
const UPCOMINGMOVIES = "movie/upcoming";
const TOPRATEDMOVIES = "movie/top_rated";

const SPECIALIZATION = "genre/movie/list";

const SEARCHMOVIE = "search/movie";

String getId(int id)
{
  return "movie/${id}";
}

String getActorId(int id)
{
  return "movie/${id}/credits";
}


