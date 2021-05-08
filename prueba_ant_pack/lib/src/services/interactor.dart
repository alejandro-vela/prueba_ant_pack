import '../services/factory.dart';
import '../models/users.dart';

class ServiceInteractor extends ServiceFactory {
  Future<List<Users>> getUsers() async {
    String output = await handleMethod(
      'GET',
      '$routeBase$routeUsers',
    );
    if (output != null) {
      var list = usersFromMap(output);
      return list;
    } else {
      return null;
    }
  }
}
