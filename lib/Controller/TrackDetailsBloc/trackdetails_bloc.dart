import 'dart:async';
import 'package:Music/Controller/NetworkBloc/network_bloc.dart';
import 'package:Music/Model/trackDetails.Model.dart';
import 'package:Music/Repository/music.Repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'trackdetails_event.dart';
part 'trackdetails_state.dart';

class TrackDetailsBloc extends Bloc<TrackdetailsEvent, TrackdetailsState> {
  final NetworkBloc networkBloc;
  final int trackId;
  TrackDetailsBloc({@required this.networkBloc, @required this.trackId})
      : super(Loading()) {
    _streamSubscription = networkBloc.listen((networkState) {
      if (networkState is NetworkDisconnected)
        add(NotConnected());
      else
        add(Connected());
    });
  }

  StreamSubscription _streamSubscription;
  MusicRepo _musicRepo = MusicRepo();

  @override
  Stream<TrackdetailsState> mapEventToState(
    TrackdetailsEvent event,
  ) async* {
    if (event is Connected) {
      yield Loading();

      try {
        // call track details api
        final trackDetails = await _musicRepo.trackDetails(trackId);
        yield TrackDetailsLoaded(trackDetailsModel: trackDetails, lyrics: null);
        // call lyrics api
        final lyrics = await _musicRepo.trackLyrics(trackId);
        yield TrackDetailsLoaded(trackDetailsModel: trackDetails, lyrics: lyrics);
      } catch (e) {
        print(e);
        yield ErrorLoadingData();
      }
    } else if (event is NotConnected) {
      yield NoInternet();
    }
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
