import 'package:get/get.dart';
import 'specials_item_model.dart';
import 'upcoming_item_model.dart';
import 'featured_item_model.dart';
import 'upcoming1_item_model.dart';
import 'categories_item_model.dart';
import 'special_item_model.dart';

class DashboardModel {
  Rx<List<SpecialsItemModel>> specialsItemList =
      Rx(List.generate(4, (index) => SpecialsItemModel()));

  Rx<List<UpcomingItemModel>> upcomingItemList =
      Rx(List.generate(4, (index) => UpcomingItemModel()));

  Rx<List<FeaturedItemModel>> featuredItemList =
      Rx(List.generate(4, (index) => FeaturedItemModel()));

  Rx<List<Upcoming1ItemModel>> upcoming1ItemList =
      Rx(List.generate(4, (index) => Upcoming1ItemModel()));

  Rx<List<CategoriesItemModel>> categoriesItemList =
      Rx(List.generate(4, (index) => CategoriesItemModel()));

  Rx<List<SpecialItemModel>> specialItemList =
      Rx(List.generate(4, (index) => SpecialItemModel()));
}
