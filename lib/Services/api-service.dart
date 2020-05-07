import 'dart:convert';
import 'package:http/http.dart';

const String API_URL = "http://www.mocky.io/v2/5dfccffc310000efc8d2c1ad";

Future getData() async {
  try {
    print("Started");
    Response response = await get(API_URL);
    List body = jsonDecode(response.body);
    print(body[0]['table_menu_list'].length);
  } catch (e) {
    print("Error on getData $e");
  }
}

Future<List<String>> getTableMenuItems() async {
  List<String> _tableMenuitems = [];
  try {
    Response response = await get(API_URL);
    List body = jsonDecode(response.body);

    for(int i=0; i<body[0]['table_menu_list'].length; i++){
      _tableMenuitems.add(body[0]['table_menu_list'][i]['menu_category']);
    }

    return _tableMenuitems;
  } catch (e) {
    print("Error on getTableMenuItems $e");
  }
}