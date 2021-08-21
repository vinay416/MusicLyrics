part of 'trending_bloc.dart';

abstract class MusicState extends Equatable {
  const MusicState();

  @override
  List<Object> get props => [];
}

class Loading extends MusicState {}

class NoInternet extends MusicState {}

class TrendingLoaded extends MusicState {
  final List<TrendingModel> trendings;

  TrendingLoaded(this.trendings);

  @override
  List<Object> get props => [trendings];
}

class ErrorLoadingData extends MusicState {}
