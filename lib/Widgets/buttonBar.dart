import 'package:flutter/material.dart';
import 'package:mock_app/Services/cartService.dart';

class ButtonBarItem extends StatefulWidget {
  final CartItem item;
  const ButtonBarItem({
    Key key,
    this.item,
  }) : super(key: key);

  @override
  _ButtonBarItemState createState() => _ButtonBarItemState();
}

class _ButtonBarItemState extends State<ButtonBarItem> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(15.0)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '-',
                style: TextStyle(fontSize: 32.0),
              ),
            ),
            onTap: () {
              if (count > 0) {
                setState(() {
                  count--;
                  widget.item.decreasecounter();
                });
              }
            },
          ),
          Text(count.toString()),
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  count++;
                  widget.item.increaseCounter();
                });
              }),
        ],
      ),
    );
  }
}
