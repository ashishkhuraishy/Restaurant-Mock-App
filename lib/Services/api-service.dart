import 'dart:convert';
import 'package:http/http.dart';
import 'package:mock_app/models/category.dart';

const String API_URL = "http://www.mocky.io/v2/5dfccffc310000efc8d2c1ad";

Future<String> getName() async {
  try {
    print("Started");
    Response response = await get(API_URL);
    List body = jsonDecode(response.body);
    return body[0]['restaurant_name'];
  } catch (e) {
    print("Error on getName $e");
  }
}

Future<List<String>> getTableMenuItems() async {
  List<String> _tableMenuitems = [];
  try {
    Response response = await get(API_URL);
    List body = jsonDecode(response.body);

    for (int i = 0; i < body[0]['table_menu_list'].length; i++) {
      _tableMenuitems.add(body[0]['table_menu_list'][i]['menu_category']);
    }

  } catch (e) {
    print("Error on getTableMenuItems $e");
  }

  return _tableMenuitems;
}

Future<List<DishItem>> getAllData() async {
  List<DishItem> _dishItems = [];

  try {
    Response response = await get(API_URL);
    List body = jsonDecode(response.body);

    for (int i = 0; i < body[0]['table_menu_list'].length; i++) {
      String catName = body[0]['table_menu_list'][i]['menu_category'];
      for (int j = 0;
          j <
              body[0]['table_menu_list'][i]['category_dishes']
                  .length;
          j++) {
        String dishName = body[0]['table_menu_list'][i]
            ['category_dishes'][j]['dish_name'];
        String dishImage = body[0]['table_menu_list'][i]
            ['category_dishes'][j]['dish_image'];
        String dishcalories = body[0]['table_menu_list'][i]
                ['category_dishes'][j]['dish_calories']
            .toString();
        String dishDesc = body[0]['table_menu_list'][i]
            ['category_dishes'][j]['dish_description'];
        String dishPrice = body[0]['table_menu_list'][i]
                ['category_dishes'][j]['dish_currency'] +
            " " +
            body[0]['table_menu_list'][i]['category_dishes'][j]
                ['dish_price'].toString();
        bool custom = body[0]['table_menu_list'][i]
                    ['category_dishes'][j]['addonCat']
                .length >
            0;

        _dishItems.add(
          DishItem(
            category: catName,
            custom: custom,
            dishCalories: dishcalories,
            dishDescription: dishDesc,
            dishImg: dishImage,
            dishName: dishName,
            dishPrice: dishPrice,
          ),
        );
      }
    }
  } catch (e) {
    print("Error in getAllData : $e");
  }

  return _dishItems;
}
