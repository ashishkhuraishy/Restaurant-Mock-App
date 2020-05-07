import 'package:flutter/material.dart';
import 'package:mock_app/Services/api-service.dart';
import 'package:mock_app/models/category.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  List<String> _tabTitleList;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    startloading();
    
  }

  startloading() async {
    getData();
    var temp = await getTableMenuItems();
    setState(() {
      _tabTitleList = temp;
    });
    _tabController = new TabController(length: _tabTitleList.length, vsync: this);
    print(_tabTitleList);
  }

  @override
  Widget build(BuildContext context) {
    return _tabTitleList != null
        ? Scaffold(
            appBar: AppBar(
              title: Text("Restaurent"),
              bottom: TabBar(isScrollable: true,tabs: _tabTitleList.map((e) => Tab(child: Text(e))).toList(), controller: _tabController,),
            ),
            body: TabBarView(controller: _tabController,children: _tabTitleList.map((e) => TabBody(category: e,)).toList()),
          )
        : Loading();
  }
}

class TabBody extends StatelessWidget {
  final String category;
  const TabBody({
    Key key,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(category),);
  }
}

class Loading extends StatelessWidget {
  const Loading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
