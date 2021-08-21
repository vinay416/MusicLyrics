part of 'trending_bloc.dart';

abstract class MusicEvent extends Equatable {
  const MusicEvent();

  @override
  List<Object> get props => [];
}

class Connected extends MusicEvent {}

class NotConnected extends MusicEvent {}


