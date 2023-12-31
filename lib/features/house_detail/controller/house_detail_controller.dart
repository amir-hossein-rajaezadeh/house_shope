import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_selling/data/house_list.dart';

class HouseDetailController extends GetxController
    with GetTickerProviderStateMixin {
  //                            -----<<<<TODO>>>>----
  //                        Init Animations and variables
  double resizeHeight = 12.0;
  late AnimationController controller;

  late final AnimationController insideHouseImageListViewController =
      AnimationController(
    duration: const Duration(milliseconds: 900),
    vsync: this,
  );

  late final Animation<Offset> insideHouseImageListViewOffsetAnimation =
      Tween<Offset>(
    begin: const Offset(1.5, 0.0),
    end: Offset.zero,
  ).animate(insideHouseImageListViewController);

  late final AnimationController houseRateAndPriceController =
      AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );

  late final Animation<Offset> houseRateOffsetAnimation = Tween<Offset>(
    begin: const Offset(4, 0.0),
    end: Offset.zero,
  ).animate(houseRateAndPriceController);

  late final Animation<Offset> housePriceOffsetAnimation = Tween<Offset>(
    begin: const Offset(-4, 0.0),
    end: Offset.zero,
  ).animate(houseRateAndPriceController);

  late final AnimationController titleController = AnimationController(
    duration: const Duration(milliseconds: 800),
    vsync: this,
  );

  late final Animation<Offset> titleOffseftAnimation = Tween<Offset>(
    begin: const Offset(0.0, 4),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: titleController, curve: Curves.easeIn));

  late final Animation<Offset> distanceOffseftAnimation = Tween<Offset>(
    begin: const Offset(0.0, 6),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: titleController, curve: Curves.easeIn));

  late final Animation<double> titleFadeAnimation =
      CurvedAnimation(parent: titleController, curve: Curves.easeIn);

  late final AnimationController houseInfoController = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );

  late final Animation<Offset> houseInfoOffsetAnimation = Tween<Offset>(
    begin: const Offset(-1.5, 0.0),
    end: Offset.zero,
  ).animate(houseInfoController);

  late final Animation<Offset> houseDescOffsetAnimation = Tween<Offset>(
    begin: const Offset(0.0, 1.5),
    end: Offset.zero,
  ).animate(houseDescController);

  late final AnimationController houseDescController = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );

  late final Animation<double> houseDescFadeAnimation =
      CurvedAnimation(parent: houseDescController, curve: Curves.easeIn);

  double callIconHeight = 0.0;

  void likeHouse(int selectedHomeIndex) {
    bool selectedHouseItem = HouseList().houseList[selectedHomeIndex].isLiked;
    selectedHouseItem ? selectedHouseItem = false : selectedHouseItem = true;
    HouseList().houseList[selectedHomeIndex].isLiked;
    update();
  }

  void initHouseDetail() async {
    //                                     -------<<<<TODO>>>>------
    //                                          Start Animations
    await Future.delayed(
      const Duration(milliseconds: 300),
    );
    insideHouseImageListViewController.forward();
    await Future.delayed(
      const Duration(milliseconds: 500),
    );
    houseRateAndPriceController.forward();
    await Future.delayed(
      const Duration(milliseconds: 300),
    );
    titleController.forward();
    await Future.delayed(
      const Duration(milliseconds: 450),
    );
    houseInfoController.forward();
    await Future.delayed(
      const Duration(milliseconds: 400),
    );
    houseDescController.forward();
    {
      callIconHeight = 50.0;
      update();
    }
  }

  //                                     -----<<<<TODO>>>>----
  //                          When Buy Now button pressed this function called
  void buyNowButton() {}

  void initHouseListPage() async {}

  @override
  void onInit() async {
    //                                     -----<<<<TODO>>>>----
    // When HouseListPage created this onInitFun called but in the HouseDetailPage initHouseDetail function called.
    controller = BottomSheet.createAnimationController(this);
    controller.duration = const Duration(milliseconds: 800);
    await Future.delayed(
      const Duration(milliseconds: 1100),
    );
    resizeHeight = 200.0;
    update();
    super.onInit();
  }
}
