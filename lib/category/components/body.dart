import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_foodnow_app/category/components/category_detail.dart';

class Body extends StatelessWidget {
  int cateid;
  Body(this.cateid);
  @override
  Widget build(BuildContext context){
    return Container(
      child: CategoryDetail(cateid));
    }
  }