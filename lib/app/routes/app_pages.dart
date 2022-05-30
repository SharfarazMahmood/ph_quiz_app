import 'package:get/get.dart';

import '../modules/QAPage/bindings/q_a_page_binding.dart';
import '../modules/QAPage/views/q_a_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.Q_A_PAGE,
      page: () => QAPageView(),
      binding: QAPageBinding(),
    ),
  ];
}
