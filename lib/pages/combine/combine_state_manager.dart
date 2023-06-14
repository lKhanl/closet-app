import 'package:MyCombinationsApp/services/combine_service.dart';
import 'package:MyCombinationsApp/utils/validator.dart';
import 'package:get_it/get_it.dart';

import '../../model/combine_model.dart';

class CombineStateManager {
  final _combineService = GetIt.instance.get<CombineService>();
  String _name = 'asdasd';
  int _topId = 0;
  int _bottomId = 0;
  int _shoesId = 0;

  void setName(String name) {
    _name = name;
  }

  void setTopId(int topId) {
    _topId = topId;
  }

  void setBottomId(int bottomId) {
    _bottomId = bottomId;
  }

  void setShoesId(int shoesId) {
    _shoesId = shoesId;
  }

  create() {
    validate({
      'Name': _name,
      'Top': _topId.toString(),
      'Bottom': _bottomId.toString(),
      'Shoes': _shoesId.toString(),
    });

    _combineService.createCombine(_name, _topId, _bottomId, _shoesId);
  }

  void update(int id) {
    validate({
      'Name': _name,
    });

    _combineService.updateCombine(id, _name);
  }

  Future<List<Combine>> get() async {
    return await _combineService.getCombines();
  }

  void delete(int id) {
    _combineService.delete(id);
  }

  Future<Combine> randomize() {
    return _combineService.randomize();
  }

}
