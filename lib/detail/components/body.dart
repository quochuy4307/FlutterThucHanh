import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_foodnow_app/detail/components/addtocart.dart';
import 'package:flutter_foodnow_app/model/products.dart';
import 'package:flutter_foodnow_app/model/categories.dart';
import 'package:quantity_input/quantity_input.dart';

class Body extends StatefulWidget {
  Products product;
  Body({required this.product});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final cate = Categories.init();

  int simpleIntInput = 1;

  @override
  Widget build(BuildContext context) {
    var category = cate.firstWhere((item) => item.id == widget.product.cateid);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            new Text("Title: ${widget.product.title}"),
            new Text("Category: ${category.title}"),
          ]),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Image.asset(widget.product.image.toString())),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Text("Description: ${widget.product.description}"),
            flex: 1,
          ),
          Expanded(
            child: Text("Price: ${widget.product.price}"),
            flex: 1,
          ),
          QuantityInput(
            value: simpleIntInput,
            onChanged: (value) => setState(
                () => simpleIntInput = int.parse(value.replaceAll('.', ''))),
          ),
          AddProductToCart(
            product: widget.product,
            quantity: simpleIntInput,
          )
        ],
      ),
    );
  }
}
