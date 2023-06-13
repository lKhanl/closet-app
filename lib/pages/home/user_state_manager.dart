import 'package:MyCombinationsApp/model/user_model.dart';
import 'package:get_it/get_it.dart';

import '../../services/user_service.dart';

class UserStateManager {
  final _userService = GetIt.instance.get<UserService>();

  Future<User> get() async {
    return await _userService.getProfile();
  }
}
