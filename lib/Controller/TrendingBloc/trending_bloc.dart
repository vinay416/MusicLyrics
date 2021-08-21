import 'dart:async';
import 'package:Music/Controller/NetworkBloc/network_bloc.dart';
import 'package:Music/Model/trending.Model.dart';
import 'package:Music/Repository/music.Repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingBloc extends Bloc<MusicEvent, MusicState> {
  final NetworkBloc networkBloc;
  final MusicRepo _musicRepo = MusicRepo();

  TrendingBloc(this.networkBloc) : super(Loading()) {
    _streamSubscription = networkBloc.listen((networkState) {
      if (networkState is NetworkConnected)
        add(Connected());
      else
        add(NotConnected());
    });
  }

  StreamSubscription _streamSubscription;

  @override
  Stream<MusicState> mapEventToState(
    MusicEvent event,
  ) async* {
    if (event is Connected) {
      yield Loading();
      // call Api to fetch trendings
      try {
        final trendings = await _musicRepo.trendings();
        yield TrendingLoaded(trendings);
      } on Exception catch (e) {
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
