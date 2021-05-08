import 'package:bloc/bloc.dart';

import 'package:prueba_ant_pack/src/models/users.dart';
import '../../services/interactor.dart';
import 'bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({List<Users> users}) : super(Uninitialized());
  ServiceInteractor interactor = ServiceInteractor();
  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    }
    if (event is ShowDataEvent) {
      yield* _mapAppStartedToState();
    }
  }

  Stream<MainState> _mapAppStartedToState() async* {
    try {
      List<Users> users = await interactor.getUsers();
      yield ShowData(users: users);
    } catch (err) {
      yield Uninitialized();
      print(err.runTimeType);
    }
  }
}
