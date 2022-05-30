import 'package:get/get.dart';

import '../controllers/q_a_page_controller.dart';

class QAPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QAPageController>(
      () => QAPageController(),
    );
  }
}
