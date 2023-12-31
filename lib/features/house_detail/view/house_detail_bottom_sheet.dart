import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_selling/data/model/house_item.dart';
import 'package:house_selling/features/house_detail/controller/house_detail_controller.dart';
import '../../../../utils/my_assets.dart';
import '../../../../utils/my_colors.dart';
import '../../../../utils/my_strings.dart';

class HouseDetailBottomSheet {
  void modalBottomSheetMenu(BuildContext context,
      HouseDetailController controller, HouseItem houseItemArgument) {
    showModalBottomSheet(
        barrierColor: Colors.black.withOpacity(0.1),
        context: context,
        isScrollControlled: true,
        transitionAnimationController: controller.controller,
        isDismissible: false,
        enableDrag: false,
        builder: (builder) {
          return Wrap(children: [
            _buildInsideImageListWidget(controller, houseItemArgument),
            _buildHousePriceWidget(controller, houseItemArgument),
            _buildHouseInfoWidget(controller, houseItemArgument),
            FadeTransition(
              opacity: controller.houseDescFadeAnimation,
              child: SlideTransition(
                position: controller.houseDescOffsetAnimation,
                child: Container(
                  height: 0.7,
                  margin: const EdgeInsets.only(
                    top: 15,
                  ),
                  color: Colors.grey,
                ),
              ),
            ),
            FadeTransition(
              opacity: controller.houseDescFadeAnimation,
              child: SlideTransition(
                position: controller.houseDescOffsetAnimation,
                child: Container(
                  margin: const EdgeInsets.only(right: 20, left: 20, top: 12),
                  child: const Text(
                    MyStrings.houseDesc,
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
              ),
            ),
            _buildOwnerInfoWidget(controller, houseItemArgument),
            SlideTransition(
              position: controller.houseDescOffsetAnimation,
              child: GestureDetector(
                onTap: () => controller.buyNowButton(),
                child: Container(
                  margin: const EdgeInsets.only(
                      right: 20, left: 20, top: 30, bottom: 20),
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: MyColors.pink),
                  child: const Center(
                    child: Text(
                      MyStrings.buyNow,
                      style: TextStyle(
                          color: MyColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            )
          ]);
        }).whenComplete(() async {
      //                            -----<<<<TODO>>>>----
      //                    When BackButton pressed in HouseDetail Page.
      Get.back();
      Get.back();
    });
  }

  Container _buildOwnerInfoWidget(
      HouseDetailController controller, HouseItem houseItemArgument) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FadeTransition(
            opacity: controller.houseDescFadeAnimation,
            child: SlideTransition(
              position: controller.houseDescOffsetAnimation,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      houseItemArgument.ownerImage,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          MyStrings.ownerApartment,
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Text(houseItemArgument.owner)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          _buildCallIconWidget(),
        ],
      ),
    );
  }

  Container _buildHousePriceWidget(
      HouseDetailController controller, HouseItem houseItemArgument) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 12, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SlideTransition(
                position: controller.housePriceOffsetAnimation,
                child: Row(
                  children: [
                    Text(
                      '\$${houseItemArgument.price} ',
                      style: const TextStyle(
                          color: MyColors.pink,
                          fontSize: 25,
                          fontWeight: FontWeight.w800),
                    ),
                    const Text(
                      MyStrings.day,
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      width: 5,
                      height: 5,
                      decoration: const BoxDecoration(color: Colors.grey),
                    ),
                    const Text(
                      MyStrings.house,
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    )
                  ],
                ),
              ),
              SlideTransition(
                position: controller.houseRateOffsetAnimation,
                child: RichText(
                  text: TextSpan(
                    children: [
                      const WidgetSpan(
                        child: Icon(
                          CupertinoIcons.star_fill,
                          size: 19,
                          color: MyColors.pink,
                        ),
                      ),
                      TextSpan(
                        text: houseItemArgument.houseRate.toString(),
                        style: const TextStyle(
                            color: MyColors.pink,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          FadeTransition(
            opacity: controller.titleFadeAnimation,
            child: SlideTransition(
              position: controller.titleOffseftAnimation,
              child: SizedBox(
                width: 300,
                child: Text(
                  houseItemArgument.title,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      height: 0.9, fontSize: 32, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          FadeTransition(
            opacity: controller.titleFadeAnimation,
            child: SlideTransition(
              position: controller.distanceOffseftAnimation,
              child: Container(
                margin: const EdgeInsets.only(bottom: 16, top: 5),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.location_solid,
                      color: Colors.grey,
                    ),
                    Text(
                      "${houseItemArgument.distance} ${MyStrings.awayNework}",
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  SlideTransition _buildHouseInfoWidget(
      HouseDetailController controller, HouseItem houseItemArgument) {
    return SlideTransition(
      position: controller.houseInfoOffsetAnimation,
      child: Container(
        margin: const EdgeInsets.only(right: 20, left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHouseInfoItemWidget(
              '${houseItemArgument.bedRooms} ${MyStrings.bedroom}',
              const Icon(
                CupertinoIcons.bed_double_fill,
                color: MyColors.pink,
              ),
            ),
            _buildHouseInfoItemWidget(
              '${houseItemArgument.bathRooms} ${MyStrings.bathroom}',
              const ImageIcon(
                AssetImage(MyAssets.bathroom),
                color: MyColors.pink,
              ),
            ),
            _buildHouseInfoItemWidget(
              '${houseItemArgument.floors} ${MyStrings.floors}',
              const Icon(
                CupertinoIcons.layers_alt_fill,
                color: MyColors.pink,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildInsideImageListWidget(
      HouseDetailController controller, HouseItem houseItemArgument) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 16),
      height: 80,
      child: SlideTransition(
        position: controller.insideHouseImageListViewOffsetAnimation,
        child: ListView.separated(
          itemCount: houseItemArgument.homeImageList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(left: 0),
              height: 80,
              width: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  houseItemArgument.homeImageList[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              width: 12,
            );
          },
        ),
      ),
    );
  }

  GetBuilder<HouseDetailController> _buildCallIconWidget() {
    return GetBuilder<HouseDetailController>(
      builder: (controller) => AnimatedContainer(
        width: controller.callIconHeight,
        height: controller.callIconHeight,
        duration: const Duration(milliseconds: 800),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: Colors.black),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(13.0),
            child: Icon(
              CupertinoIcons.phone_fill,
              color: MyColors.white,
            ),
          ),
        ),
      ),
    );
  }

  Container _buildHouseInfoItemWidget(String itemTitle, Widget icon) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(children: [
          const Icon(
            CupertinoIcons.bed_double_fill,
            color: MyColors.pink,
          ),
          Text(itemTitle),
        ]),
      ),
    );
  }
}
