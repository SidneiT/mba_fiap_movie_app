class MovieResponseDto {
  final int _id;
  final String _posterPath;
  final String _overview;
  final String _releaseDate;
  final String _title;
  final String _backdropPath;
  final double _voteAverage;

  MovieResponseDto(this._id, this._posterPath, this._overview,
      this._releaseDate, this._title, this._backdropPath, this._voteAverage);

  get id => _id;
  get posterPath => _posterPath;
  get overview => _overview;
  get releaseDate => _releaseDate;
  get title => _title;
  get backdropPath => _backdropPath;
  get voteAverage => _voteAverage;
}
