import 'package:bookshelf/bookshelf_list.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Bookshelf extends StatefulWidget {
  @override
  _BookshelfState createState() => _BookshelfState();
}

class _BookshelfState extends State<Bookshelf> {

String _title = '';
String _author = '';

  void _setTitle(title) {
    setState(() {
      _title = title;
    });
  }

  void _setAuthor(author) {
    setState(() {
      _author = author;
    });
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    CollectionReference books = firestore.collection('books');

    Future<void> addBook() {
      return books.add({
        'title': _title,
        'author': _author
      })
      .then((value) => print('Book added'))
      .catchError((error) => print('Failed to add user: $error'));
    }

    return Container(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(body: 
        Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Book Title'
              ),
              onChanged: (String value) => _setTitle(value)
            ),
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Book Author'
              ),
              onChanged: (String value) => _setAuthor(value)
            ),
            TextButton(
              onPressed: addBook,
              child: Text('Add Book')
            ),
            Expanded( child: BookshelfList())
          ]
        )
      ),
    );
  }
}