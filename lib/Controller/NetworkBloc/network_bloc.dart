import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc() : super(NetworkInitial()) {
    _connectionMonitor();
  }

  void _connectionMonitor() {
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none)
        add(ConnectionChanged(false));
      else
        add(ConnectionChanged(true));
    });
  }

  StreamSubscription _subscription;

  @override
  Stream<NetworkState> mapEventToState(
    NetworkEvent event,
  ) async* {
    if (event is ConnectionChanged) {
      if (event.connected)
        yield NetworkConnected();
      else
        yield NetworkDisconnected();
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
