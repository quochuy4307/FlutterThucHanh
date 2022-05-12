import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_foodnow_app/cart/components/body.dart';
import 'package:flutter_foodnow_app/model/carts.dart';
import 'package:flutter_foodnow_app/model/products.dart';

class NotificationDetail extends StatelessWidget {
  static String routeName = "/notify";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Order Detail"),
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<CartItem> cartdetails = Cart().getCart().toList();

  double sum = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartdetails.forEach((item) {
      sum = sum + item.quantity * item.product.price!.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: cartdetails.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        child: Item(
                          product: cartdetails[index].product,
                          quantity: cartdetails[index].quantity,
                        ),
                        onTap: () {
                          setState(() {});
                        },
                      ),
                      Divider(),
                    ],
                  );
                }),
          ),
          Prices(sum: sum)
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  Products product;
  int quantity;

  Item({required this.product, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF5F5F5),
      padding: EdgeInsets.all(16),
      child: Row(children: [
        SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(product.image.toString())),
        Expanded(child: Text(product.title.toString())),
        Expanded(child: Text(product.price.toString())),
        Expanded(child: Text(quantity.toString())),
      ]),
    );
  }
}

class Prices extends StatelessWidget {
  double sum;
  Prices({required this.sum});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: FlatButton(
            height: 50,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
                side: BorderSide(color: Colors.green)),
            color: Colors.white,
            textColor: Colors.green,
            onPressed: () {},
            child: Text(
              "Tổng tiền: ${sum}",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
