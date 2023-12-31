import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_selling/data/house_list.dart';
import 'package:house_selling/data/model/house_item.dart';
import 'package:house_selling/features/house_detail/controller/house_detail_controller.dart';
import 'package:house_selling/features/house_detail/view/house_detail_bottom_sheet.dart';
import 'package:house_selling/utils/my_colors.dart';

class HouseDetailPage extends GetView<HouseDetailController> {
  HouseDetailPage({super.key});

  final HouseItem houseItemArgument = HouseList().houseList[Get.arguments];

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => HouseDetailController(),
    );
    controller.initHouseDetail();
    Future.microtask(
      () => HouseDetailBottomSheet()
          .modalBottomSheetMenu(context, controller, houseItemArgument),
    );
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            houseItemArgument.image,
            height: 320,
            fit: BoxFit.cover,
          ),
          GetBuilder<HouseDetailController>(
            builder: (controller) => Positioned(
              right: 0,
              child: Container(
                margin: const EdgeInsets.only(top: 60, right: 20),
                width: 47,
                height: 47,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: MyColors.white),
                child: const Icon(
                  CupertinoIcons.heart,
                  size: 26,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
