import 'package:flutter/material.dart';
import 'package:mock_app/Services/cartService.dart';
import 'package:mock_app/Widgets/buttonBar.dart';
import 'package:mock_app/models/category.dart';

class TabBody extends StatelessWidget {
  final List<DishItem> items;
  final CartItem cartItem;
  const TabBody({
    Key key,
    this.items,
    this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;

    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, idx) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.asset(
                        'assets/images/veg.png',
                        height: 28.0,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      items[idx].dishName,
                                      style: theme.headline6
                                          .copyWith(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          items[idx].dishPrice,
                                          style: theme.subtitle2,
                                        ),
                                        Text(
                                          "${items[idx].dishCalories} calories ",
                                          style: theme.subtitle2,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Text(
                                      items[idx].dishDescription,
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Image.network(
                                  items[idx].dishImg,
                                ),
                              )
                            ],
                          ),
                        ),
                        ButtonBarItem(
                          item: cartItem,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        items[idx].custom ? Customisation(theme: theme) :Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class Customisation extends StatelessWidget {
  const Customisation({
    Key key,
    @required this.theme,
  }) : super(key: key);

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "Customisation available",
            style:
                theme.subtitle2.copyWith(color: Colors.red),
          ),
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }
}
