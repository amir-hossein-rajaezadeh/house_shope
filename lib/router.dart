import 'package:get/get.dart';
import 'package:house_selling/features/house_detail/view/house_detail_page.dart';

class AppRoutes {
  static const String houseDetail = '/houseDetail';

  static List<GetPage> get pages => [
        GetPage(
            name: houseDetail,
            page: () => HouseDetailView(),
            transition: Transition.fadeIn),
      ];
}
