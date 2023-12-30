class HouseItem {
  String title;
  String image;
  String ownerImage;
  double houseRate;
  int price;
  String type;
  String distance;
  int bedRooms;
  int floors;
  int bathRooms;
  String owner;
  bool isLiked;
  final List<String> homeImageList;

  HouseItem(
      {required this.title,
      required this.image,
      required this.houseRate,
      required this.price,
      required this.type,
      required this.owner,
      required this.ownerImage,
      required this.isLiked,
      required this.distance,
      required this.bedRooms,
      required this.floors,
      required this.bathRooms,
      required this.homeImageList});
}
