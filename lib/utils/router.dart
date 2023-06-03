import 'package:ClosetApp/pages/base_stateless_page.dart';
import 'package:get/get.dart';

import '../pages/base_statefull_page.dart';

class RouterUtils {
  static void goStateless(BaseStatelessPage page) {
    Get.offAll(() => page);
  }
  static void goStateful(BaseStatefulPage page) {
    Get.offAll(() => page);
  }
}
