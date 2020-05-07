class DishItem {
  String category;
  String dishName;
  String dishPrice;
  String dishImg;
  String dishCalories;
  String dishDescription;
  bool custom;

  DishItem(
      {this.category,
      this.dishCalories,
      this.custom,
      this.dishDescription,
      this.dishImg,
      this.dishName,
      this.dishPrice});
}
