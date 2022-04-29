import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_foodnow_app/detail/components/addtocart.dart';
import 'package:flutter_foodnow_app/model/products.dart';
import 'package:flutter_foodnow_app/model/categories.dart';

class Body extends StatelessWidget {
  Products product;
  Body({required this.product});
  final cate = Categories.init();
  @override
  Widget build(BuildContext context) {
    var category = cate.firstWhere((item) => item.id == product.cateid);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Text("Title: ${product.title}" ), flex: 1,),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200 ,
            child: Image.asset(product.image.toString())
            ),
          SizedBox(height: 20,),
          Expanded(child: Text("Description: ${product.description}" ), flex: 1,),
          Expanded(child: Text("Price: ${product.price}" ), flex: 1,),
          Expanded(child: Text("Category: ${category.title}"), flex: 1,),
          AddProductToCart(product: product,)
        ],
      ),
    );
  }
}

