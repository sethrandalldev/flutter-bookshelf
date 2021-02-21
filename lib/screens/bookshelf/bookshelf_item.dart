import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookshelfItem extends StatelessWidget {

  final DocumentSnapshot book;

  BookshelfItem(this.book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text(book.data()['title']),
    );
  }
}