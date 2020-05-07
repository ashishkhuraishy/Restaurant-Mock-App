import 'package:flutter/material.dart';
import 'package:mock_app/Services/api-service.dart';
import 'package:mock_app/Services/cartService.dart';
import 'package:mock_app/Widgets/loading.dart';
import 'package:mock_app/Widgets/tabbody.dart';
import 'package:mock_app/models/category.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  String _restaurantName;
  List<String> _tabTitleList;
  List<DishItem> _allData;
  CartItem item = new CartItem();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    startloading();
  }

  startloading() async {
    var name = await getName();
    var temp = await getTableMenuItems();
    var temp2 = await getAllData();
    setState(() {
      _restaurantName = name;
      _tabTitleList = temp;
      _allData = temp2;
    });
    _tabController =
        new TabController(length: _tabTitleList.length, vsync: this);
    print(_tabTitleList);
    //print(_allData[0]);
  }

  @override
  Widget build(BuildContext context) {
    return _tabTitleList != null && _allData != null && _restaurantName != null
        ? Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.grey),
              leading: Icon(Icons.arrow_back),
              title: Text(
                _restaurantName,
                style: TextStyle(color: Colors.grey),
              ),
              backgroundColor: Colors.white,
              elevation: 0.0,
              bottom: TabBar(
                labelColor: Colors.red,
                indicatorColor: Colors.red,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                tabs: _tabTitleList.map((e) => Tab(child: Text(e))).toList(),
                controller: _tabController,
              ),
              actions: <Widget>[
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Stack(
                    children: <Widget>[
                      Center(child: Image.asset('assets/images/cart.png', height: 32.0,)),
                      Positioned(
                        top:2,
                        right: 0,
                        child: ValueListenableBuilder<int>(
                          valueListenable: item.count,
                          builder: (context, val, widget) {
                            return val > 0 ? Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                              child: Center(
                                  child: Text(
                                val.toString(),
                                style: Theme.of(context).textTheme.overline.copyWith(color: Colors.white),
                              )),
                            ) : Container();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 16.0,
                ),
              ],
            ),
            body: TabBarView(
                controller: _tabController,
                children: _tabTitleList
                    .map((e) => TabBody(
                          items: _allData
                              .where((element) => element.category == e)
                              .toList(),
                          cartItem: item,
                        ))
                    .toList()),
          )
        : Loading();
  }
}
