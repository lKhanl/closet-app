import 'package:MyCombinationsApp/model/top_model.dart';
import 'package:MyCombinationsApp/services/top_service.dart';
import 'package:MyCombinationsApp/utils/validator.dart';
import 'package:get_it/get_it.dart';

class TopStateManager {
  final _topService = GetIt.instance.get<TopService>();
  String _name = '';

  void setName(String name) {
    _name = name;
  }

  void create() {
    validate({
      'Name': _name,
    });

    _topService.createTop(_name);
  }

  void update(int id) {
    validate({
      'Name': _name,
    });

    _topService.updateTop(id, _name);
  }

  Future<List<Top>> getTops() async {
    return await _topService.getTops();
  }

  void delete(int id) {
    _topService.delete(id);
  }
}
