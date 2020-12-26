import 'package:bookshelf/bookshelf_list.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Bookshelf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    CollectionReference books = firestore.collection('books');

    Future<void> addBook() {
      return books.add({
        'title': 'Ready Player One',
        'author': 'Ernest Cline'
      })
      .then((value) => print('Book added'))
      .catchError((error) => print('Failed to add user: $error'));
    }

    return Column(
      children: [
        TextButton(
          onPressed: addBook,
          child: Text('Add Book')
        ),
        Expanded(child: Card(child: BookshelfList()))
      ]
    );
  }
}