part of 'server_cubit.dart';

abstract class ServerState extends Equatable {
  const ServerState();

  @override
  List<Object> get props => [];
}

class ServerInitial extends ServerState {}

class ServersFetched extends ServerState {
  final List<Server> servers;

  const ServersFetched({required this.servers});

  @override
  List<Object> get props => [servers];
}

class ServersEmpty extends ServerState {}

class ServersFailed extends ServerState {}

class ServerReady extends ServerState {}

class ServerAddNewFailed extends ServerState {}

class CurrentServerFetched extends ServerState {
  final Server server;

  const CurrentServerFetched(this.server);

  @override
  List<Object> get props => [server];
}
