import 'package:MyCombinationsApp/pages/base_stateless_page.dart';
import 'package:get/get.dart';

class RouterUtils {
  static void goStateless(BasePage page) {
    Get.offAll(() => page);
  }
}
