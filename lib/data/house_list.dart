import 'package:house_selling/data/model/house_item.dart';
import 'package:house_selling/utils/my_assets.dart';

class HouseList {
  List<HouseItem> houseList = [
    HouseItem(
        title: 'Fun loving family',
        image: 'assets/images/homes/h1.jpg',
        houseRate: 4.7,
        price: 16,
        type: 'Home',
        distance: '1km',
        bedRooms: 1,
        floors: 1,
        bathRooms: 2,
        homeImageList: [MyAssets.i1, MyAssets.i2, MyAssets.i3, MyAssets.i4],
        isLiked: false,
        owner: 'Mathue Gome',
        ownerImage: MyAssets.p1),
    HouseItem(
        title: 'A Small Family in a Big House',
        image: 'assets/images/homes/h2.jpg',
        houseRate: 4.7,
        price: 16,
        type: 'Apartmnet',
        distance: '3km',
        bedRooms: 2,
        floors: 2,
        bathRooms: 2,
        homeImageList: [MyAssets.i5, MyAssets.i6, MyAssets.i7, MyAssets.i8],
        owner: 'AH Rajaeezadeh',
        ownerImage: MyAssets.p2,
        isLiked: false),
  ];
}
