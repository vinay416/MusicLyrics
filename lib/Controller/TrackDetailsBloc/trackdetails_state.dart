part of 'trackdetails_bloc.dart';

abstract class TrackdetailsState extends Equatable {
  const TrackdetailsState();

  @override
  List<Object> get props => [];
}

class Loading extends TrackdetailsState {}

class NoInternet extends TrackdetailsState {}

class TrackDetailsLoaded extends TrackdetailsState {
  final TrackDetailsModel trackDetailsModel;
  final String lyrics;

  TrackDetailsLoaded({
    @required this.trackDetailsModel,
    @required this.lyrics,
  });

  @override
  List<Object> get props => [
        trackDetailsModel,
        lyrics,
      ];
}

class ErrorLoadingData extends TrackdetailsState {}
