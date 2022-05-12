import 'package:flutter/material.dart';
import 'package:flutter_foodnow_app/model/products.dart';
import 'package:flutter_foodnow_app/search/components/search_widget.dart';

class FilterLocalListPage extends StatefulWidget {
  static String routeName = "/search";
  @override
  FilterLocalListPageState createState() => FilterLocalListPageState();
}

class FilterLocalListPageState extends State<FilterLocalListPage> {
  late List<Products> books;
  String query = '';

  @override
  void initState() {
    super.initState();

    books = Products.init();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Search'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];

                  return buildBook(book);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Title or Author Name',
        onChanged: searchBook,
      );

  Widget buildBook(Products book) => ListTile(
        leading: Image.asset(
          book.image.toString(),
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(book.title.toString()),
      );

  void searchBook(String query) {
    final books = Products.init().where((book) {
      final titleLower = book.title!.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.books = books;
    });
  }
}