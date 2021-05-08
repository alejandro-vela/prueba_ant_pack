import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_ant_pack/src/bloc/mainBloc/SimpleBloc.dart';
import 'src/bloc/mainBloc/bloc.dart';
import 'src/pages/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocDelegate();

  runApp(
    BlocProvider(
      create: (context) => MainBloc()..add(AppStarted()),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<MainBloc, MainState>(builder: (context, state) {
        if (state is Uninitialized) {
          return Scaffold(
            body: Center(
              child: Image.asset("images/progress.gif"),
            ),
          );
        }
        if (state is ShowData) {
          return HomeScreen(
            users: state.users,
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
