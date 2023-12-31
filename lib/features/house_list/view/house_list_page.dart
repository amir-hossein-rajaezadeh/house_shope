import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:house_selling/data/house_list.dart';
import 'package:house_selling/data/model/house_item.dart';
import 'package:house_selling/features/house_detail/controller/house_detail_controller.dart';
import 'package:house_selling/features/house_list/controller/house_list_controller.dart';
import 'package:house_selling/router.dart';
import 'package:house_selling/utils/my_colors.dart';
import 'package:house_selling/utils/my_strings.dart';
import 'dart:math' as math;

class HouseListPage extends GetView<HouseListController> {
  const HouseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<HouseListController>();

    controller.rotationController.forward();
    controller.typeListViewController.forward();

    controller.textFadeController.forward();
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.background,
        body: Column(
          children: [
            _buildAppbar(),
            _buildTitleWidget(),
            _buildTypeListWidget(),
            _buildHouseListViewWidget()
          ],
        ),
      ),
    );
  }

  Expanded _buildHouseListViewWidget() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 33),
        child: ListView.separated(
          itemCount: HouseList().houseList.length,
          itemBuilder: (BuildContext context, int index) {
            final HouseItem houseItem = HouseList().houseList[index];
            return _buildHouseItemWidget(index, houseItem);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              height: 20,
            );
          },
        ),
      ),
    );
  }

  Container _buildTypeListWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 42.h,
      child: SlideTransition(
        position: controller.typeListViewOffsetAnimation,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              final item = controller.listviewItems[index];
              return Container(
                margin: EdgeInsets.only(left: index == 0 ? 20 : 0),
                height: 40.h,
                decoration: BoxDecoration(
                  color: index == 1 ? MyColors.pink : Colors.transparent,
                  border: Border.all(
                      color: index == 1 ? MyColors.pink : Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Center(
                    child: Text(
                      item,
                      style: TextStyle(
                          color: index == 1 ? Colors.white : Colors.black,
                          fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                width: 10.w,
              );
            },
            itemCount: controller.listviewItems.length),
      ),
    );
  }

  Container _buildTitleWidget() {
    return Container(
      margin: EdgeInsets.only(right: 60.w, left: 18.w, top: 20.h),
      child: FadeTransition(
        opacity: controller.textFadeAnimation,
        child: Text(
          MyStrings.findPerfectLocalHostsInTheArea,
          style: TextStyle(fontSize: 63.sp, height: 1),
        ),
      ),
    );
  }

  Container _buildHouseItemWidget(int index, HouseItem houseItem) {
    return Container(
      margin: EdgeInsets.only(
          right: 20,
          left: 20,
          bottom: index == (HouseList().houseList.length - 1) ? 30 : 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          Get.lazyPut(
            () => HouseDetailController(),
          );
          Get.toNamed(AppRoutes.houseDetail, arguments: index);
        },
        child: Column(
          children: [
            GetBuilder<HouseDetailController>(
              builder: (controller) => AnimatedContainer(
                curve: Curves.easeInQuint,
                height: controller.resizeHeight,
                duration: const Duration(milliseconds: 550),
                margin: const EdgeInsets.only(top: 12, right: 10, left: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    houseItem.image,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 12, right: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '\$${houseItem.price} ',
                            style: const TextStyle(
                                color: MyColors.pink,
                                fontSize: 25,
                                fontWeight: FontWeight.w800),
                          ),
                          const Text(
                            '/day',
                            style: TextStyle(fontSize: 18),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.center,
                            width: 5,
                            height: 5,
                            decoration:
                                const BoxDecoration(color: Colors.black),
                          ),
                          const Text(
                            MyStrings.house,
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const WidgetSpan(
                                child: Icon(
                                  CupertinoIcons.star_fill,
                                  size: 22,
                                  color: MyColors.pink,
                                ),
                              ),
                              TextSpan(
                                text: houseItem.houseRate.toString(),
                                style: const TextStyle(
                                    color: MyColors.pink,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: Get.width,
                    alignment: Alignment.topLeft,
                    child: Text(
                      houseItem.title,
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        const Icon(
                          CupertinoIcons.location_solid,
                          color: Colors.grey,
                        ),
                        Text(
                          "${houseItem.distance} ${MyStrings.awayNework}",
                          style:
                              const TextStyle(fontSize: 18, color: Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildAppbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(top: 15.h, left: 18.w),
          width: 105.w,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 45.w,
                child: SlideTransition(
                  position: controller.addButtonOffsetAnimation,
                  child: circleButtonsWidget(
                    MyColors.white,
                    AnimatedBuilder(
                      animation: controller.rotationController,
                      builder: (BuildContext context, Widget? child) {
                        return Transform.rotate(
                            angle: controller.rotationController.value /
                                2 *
                                math.pi,
                            child: child);
                      },
                      child: const Icon(
                        CupertinoIcons.add,
                        color: MyColors.black,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
              circleButtonsWidget(
                MyColors.black,
                const Icon(
                  CupertinoIcons.person_fill,
                  color: MyColors.white,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 18.w, top: 15.h),
          child: circleButtonsWidget(
            MyColors.white,
            const Icon(
              CupertinoIcons.search,
              color: MyColors.black,
            ),
          ),
        ),
      ],
    );
  }

  Container circleButtonsWidget(Color backgroundColor, Widget childWidget) {
    return Container(
        width: 60.w,
        height: 60.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: backgroundColor),
        child: childWidget);
  }
}
