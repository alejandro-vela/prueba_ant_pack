import 'package:flutter/material.dart';
import 'package:prueba_ant_pack/src/bloc/mainBloc/main_bloc.dart';
import '../../models/users.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home_page.dart';
import '../../bloc/mainBloc/main_event.dart';

class HomeScreen extends StatelessWidget {
  final List<Users> _users;
  HomeScreen({Key key, @required List<Users> users})
      : assert(users != null),
        _users = users,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MainBloc>(
        create: (context) =>
            MainBloc(users: _users)..add(ShowDataEvent(_users)),
        child: HomePage(),
      ),
    );
  }
}
