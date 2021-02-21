import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookshelfDialog extends StatelessWidget {

  final DocumentSnapshot book;

  BookshelfDialog(this.book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text(book.data()['title']),
    );
  }
}