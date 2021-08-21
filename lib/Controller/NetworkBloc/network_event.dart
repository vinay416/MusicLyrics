part of 'network_bloc.dart';

abstract class NetworkEvent extends Equatable {
  const NetworkEvent();

  @override
  List<Object> get props => [];
}


class ConnectionChanged extends NetworkEvent {
  final bool connected;
  ConnectionChanged(this.connected);

  @override
  List<Object> get props => [connected];
}
