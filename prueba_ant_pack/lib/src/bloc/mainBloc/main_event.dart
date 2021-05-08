import 'package:equatable/equatable.dart';
import 'package:prueba_ant_pack/src/models/users.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
  @override
  List<Object> get props => [];
}

class AppStarted extends MainEvent {}

class ShowDataEvent extends MainEvent {
  final List<Users> users;

  ShowDataEvent(this.users);
}
