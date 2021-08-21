part of 'network_bloc.dart';

abstract class NetworkState extends Equatable {
  const NetworkState();

  @override
  List<Object> get props => [];
}

class NetworkInitial extends NetworkState {
  const NetworkInitial();

  @override
  List<Object> get props => [];
}

class NetworkConnected extends NetworkState {
  const NetworkConnected();

  @override
  List<Object> get props => [];
}

class NetworkDisconnected extends NetworkState {
  const NetworkDisconnected();

  @override
  List<Object> get props => [];
}
