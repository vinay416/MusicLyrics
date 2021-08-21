part of 'trackdetails_bloc.dart';

abstract class TrackdetailsEvent extends Equatable {
  const TrackdetailsEvent();

  @override
  List<Object> get props => [];
}

class Connected extends TrackdetailsEvent {}

class NotConnected extends TrackdetailsEvent {}
