import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HouseListController extends GetxController
    with GetTickerProviderStateMixin {
  double resizeHeight = 12.0;
  //                            -----<<<<TODO>>>>----
  //                        Init Animations and variables
  List<String> listviewItems = ['All', 'House', 'Apartment', 'Town'];

  late final AnimationController typeListViewController = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );
  late final Animation<Offset> typeListViewOffsetAnimation = Tween<Offset>(
    begin: const Offset(1.5, 0.0),
    end: Offset.zero,
  ).animate(typeListViewController);

  late final Animation<Offset> addButtonOffsetAnimation = Tween<Offset>(
    begin: const Offset(1.5, 0.0),
    end: Offset.zero,
  ).animate(typeListViewController);

  late final AnimationController rotationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 1100));

  late final AnimationController textFadeController = AnimationController(
      duration: const Duration(milliseconds: 1000), vsync: this);

  late final Animation<double> textFadeAnimation =
      CurvedAnimation(parent: textFadeController, curve: Curves.easeIn);

  @override
  void onInit() async {
    resizeHeight = 200.0;
    update();
    super.onInit();
  }
}
