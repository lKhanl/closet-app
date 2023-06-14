import 'package:MyCombinationsApp/services/shoes_service.dart';
import 'package:MyCombinationsApp/utils/validator.dart';
import 'package:get_it/get_it.dart';

import '../../model/shoes_model.dart';

class ShoesStateManager {
  final _shoesService = GetIt.instance.get<ShoesService>();
  String _name = '';

  void setName(String name) {
    _name = name;
  }

  void create() {
    validate({
      'Name': _name,
    });

    _shoesService.createShoes(_name);
  }

  void update(int id) {
    validate({
      'Name': _name,
    });

    _shoesService.updateShoes(id, _name);
  }

  Future<List<Shoes>> get() async {
    return await _shoesService.getShoes();
  }
}
