import 'package:MyCombinationsApp/model/page_model.dart';
import 'package:MyCombinationsApp/services/shoes_service.dart';
import 'package:MyCombinationsApp/utils/validator.dart';
import 'package:get_it/get_it.dart';

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

  void update() {
    validate({
      'Name': _name,
    });

    _shoesService.updateShoes(_name);
  }

  Future<PagingResult> get() async {
    return await _shoesService.getShoes();
  }
}