import 'package:MyCombinationsApp/model/user_model.dart';
import 'package:get_it/get_it.dart';

import '../../services/user_service.dart';

class ProfileStateManager {
  final _profileService = GetIt.instance.get<UserService>();

  Future<User> get() async {
    return await _profileService.getProfile();
  }

  clear() {
    _profileService.clear();
  }
}
