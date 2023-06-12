import 'package:MyCombinationsApp/model/page_model.dart';
import 'package:MyCombinationsApp/services/bottom_service.dart';
import 'package:MyCombinationsApp/utils/validator.dart';
import 'package:get_it/get_it.dart';

class BottomStateManager {
  final _bottomService = GetIt.instance.get<BottomService>();
  String _name = '';

  void setName(String name) {
    _name = name;
  }

  void create() {
    validate({
      'Name': _name,
    });

    _bottomService.createBottom(_name);
  }

  void update() {
    validate({
      'Name': _name,
    });

    _bottomService.updateBottom(_name);
  }

  Future<PagingResult> get() async {
    return await _bottomService.getBottoms();
  }
}