import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../models/users.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends MainState {
  @override
  String toString() => 'No Inicializado';
}

class ShowData extends MainState {
  final List<Users> users;

  ShowData({@required this.users});
  @override
  String toString() => 'No Autenticado';
}
