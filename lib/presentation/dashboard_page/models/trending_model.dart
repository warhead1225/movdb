class TrendingModel {
  final int id;
  final String backdropPath;
  final String title;
  final String overview;
  final String posterPath;
  final String mediaType;
  final List<dynamic> genreId;
  final double voteAverage;

  TrendingModel({
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.genreId,
    required this.voteAverage,
  });

  /* 
  {
      "adult": false,
      "backdrop_path": "/aAgGrfBwna1nO4M2USxwFgK5O0t.jpg",
      "id": 713704,
      "title": "Evil Dead Rise",
      "original_language": "en",
      "original_title": "Evil Dead Rise",
      "overview": "Three siblings find an ancient vinyl that gives birth to bloodthirsty demons that run amok in a Los Angeles apartment building and thrusts them into a primal battle for survival as they face the most nightmarish version of family imaginable.",
      "poster_path": "/5ik4ATKmNtmJU6AYD0bLm56BCVM.jpg",
      "media_type": "movie",
      "genre_ids": [
        27,
        53
      ],
      "popularity": 3039.142,
      "release_date": "2023-04-12",
      "video": false,
      "vote_average": 7.201,
      "vote_count": 691
    }, */
}
