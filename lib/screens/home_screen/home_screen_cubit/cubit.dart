import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/actors_model.dart';
import 'package:movie_app/models/specialization_model.dart';
import 'package:movie_app/network/remote/dio_helper.dart';
import 'package:movie_app/screens/home_screen/home_screen_cubit/states.dart';
import '../../../models/movie_details_model.dart';
import '../../../models/trending_movies.dart';
import '../../../network/remote/end_points.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates>
{
  HomeScreenCubit() : super(HomeScreenInitialState());

  static HomeScreenCubit get(context) => BlocProvider.of(context);

  var searchController = TextEditingController();

  List<ResultsModel> trendingMovies = [];
  List<ResultsModel> nowPlayingMovies = [];
  List<ResultsModel> upomingMovies = [];

  List<ResultsModel> topRatedMovies = [];

  void getTrendingMoviesData(String endPoint)
  {
    emit(GetTrendingMoviesDataLoadingState());
    DioHelper.getData(
        url: endPoint,
      token: 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YjEzMTQ5NGM0YThhNzIxYzE2YjRkMDA5NzcyODFjZCIsIm5iZiI6MTc1Mzg2NTQ1OC4xODQsInN1YiI6IjY4ODlkY2YyODM1OGIxYzA0M2QwMjNhZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.p6is2CUsTWYNsvMxz6uyWqwkXPk9380lUMyaZaXlyqY'
    ).then((value)
    {
      if(endPoint == TRENDINGMOVIES)
      {
        trendingMovies = TrendingMoviesModel.fromJson(value.data).results!;
      } else if (endPoint == NOWPLAYINGMOVIES)
      {
        nowPlayingMovies = TrendingMoviesModel.fromJson(value.data).results!;
      } else if(endPoint == UPCOMINGMOVIES)
      {
        upomingMovies = TrendingMoviesModel.fromJson(value.data).results!;
      } else if(endPoint == TOPRATEDMOVIES)
      {
        topRatedMovies = TrendingMoviesModel.fromJson(value.data).results!;
      }
      print("this new function .........${value.data}");
      emit(GetTrendingMoviesDataSuccessState());
    },).catchError((error)
    {
      print("error occurred .. error is ${error.toString()}");
      emit(GetTrendingMoviesDataErrorState());
    },);
  }

  List<ResultsModel> searchMovies = [];

  void getSearchingMoviesData(String q)
  {
    emit(GetSearchingDataLoadingState());

    DioHelper.getData(
        url: SEARCHMOVIE,
        query: {
          'query' : q
        },
        token: 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YjEzMTQ5NGM0YThhNzIxYzE2YjRkMDA5NzcyODFjZCIsIm5iZiI6MTc1Mzg2NTQ1OC4xODQsInN1YiI6IjY4ODlkY2YyODM1OGIxYzA0M2QwMjNhZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.p6is2CUsTWYNsvMxz6uyWqwkXPk9380lUMyaZaXlyqY'
    ).then(
            (value)
        {
          searchMovies = TrendingMoviesModel.fromJson(value.data).results!;
          print("this new function .........${value.data}");
          emit(GetSearchingDataSuccessState());
        },).catchError(
            (error)
        {
          print("error occurred .. error is ${error.toString()}");
          emit(GetSearchingDataErrorState());
        });
  }

  List<GenreModel> specialization = [];

  void getSpecialization()
  {
    emit(GetSpecializationDataLoadingState());
    DioHelper.getData(
        url: SPECIALIZATION,
        token: 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YjEzMTQ5NGM0YThhNzIxYzE2YjRkMDA5NzcyODFjZCIsIm5iZiI6MTc1Mzg2NTQ1OC4xODQsInN1YiI6IjY4ODlkY2YyODM1OGIxYzA0M2QwMjNhZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.p6is2CUsTWYNsvMxz6uyWqwkXPk9380lUMyaZaXlyqY'
    ).then(
            (value)
        {
          specialization = SpecializationModel.fromJson(value.data).genres!;
          print("this new function .........${value.data}");
          emit(GetSpecializationDataSuccessState());

        },).catchError(
            (error)
        {
          print("error occurred .. error is ${error.toString()}");
          emit(GetSpecializationDataErrorState());
        },
    );
  }

  List<CastModel> cast = [];

  void getActorCast(int id)
  {
    emit(GetActorCastDataLoadingState());
    DioHelper.getData(
        url: getActorId(id),
        token: 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YjEzMTQ5NGM0YThhNzIxYzE2YjRkMDA5NzcyODFjZCIsIm5iZiI6MTc1Mzg2NTQ1OC4xODQsInN1YiI6IjY4ODlkY2YyODM1OGIxYzA0M2QwMjNhZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.p6is2CUsTWYNsvMxz6uyWqwkXPk9380lUMyaZaXlyqY'
    ).then(
          (value)
      {
        cast = ActorsModel.fromJson(value.data).cast!;
        print("this new function .........${value.data}");
        emit(GetActorCastDataSuccessState());

      },).catchError(
          (error)
      {
        print("error occurred .. error is ${error.toString()}");
        emit(GetActorCastDataErrorState());
      },
    );
  }

  MovieDetailsModel? movieDetails;

  void getMovieDetails(int id)
  {
    emit(GetMovieDetailsDataLoadingState());
    DioHelper.getData(
        url: getId(id),
        token: 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YjEzMTQ5NGM0YThhNzIxYzE2YjRkMDA5NzcyODFjZCIsIm5iZiI6MTc1Mzg2NTQ1OC4xODQsInN1YiI6IjY4ODlkY2YyODM1OGIxYzA0M2QwMjNhZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.p6is2CUsTWYNsvMxz6uyWqwkXPk9380lUMyaZaXlyqY'
    ).then(
          (value)
      {
        movieDetails = MovieDetailsModel.fromJson(value.data);
        print("this new function .........${value.data}");
        emit(GetMovieDetailsDataSuccessState());

      },).catchError(
          (error)
      {
        print("error occurred .. error is ${error.toString()}");
        emit(GetMovieDetailsDataErrorState());
      },
    );
  }

  bool notFav = true;

  void addFav()
  {
    notFav = !notFav;
    emit(AddToFavouriteState());
  }
}
