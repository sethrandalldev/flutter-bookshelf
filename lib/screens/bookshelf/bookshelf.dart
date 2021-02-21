import 'package:bookshelf/screens/bookshelf/bookshelf_list.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Bookshelf extends StatefulWidget {
  @override
  _BookshelfState createState() => _BookshelfState();
}

class _BookshelfState extends State<Bookshelf> {

  final titleFieldText = TextEditingController();
  final authorFieldText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    CollectionReference books = firestore.collection('books');

    Future<void> addBook() {
      return books.add({
        'title': titleFieldText.value,
        'author': authorFieldText.value
      })
      .then((value) {
        print('Book added');
        setState(() {
          titleFieldText.clear();
          authorFieldText.clear();
        });
      })
      .catchError((error) => print('Failed to add user: $error'));
    }

    return Container(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(title: Center(child: Text('Bookshelf'))),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100.0),
                    child: Row(
                      
                      children: [
                      Flexible(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Book Title',
                          ),
                          controller: titleFieldText,
                        ),
                      ),
                      Flexible(child:               TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Book Author'
                      ),
                      controller: authorFieldText,
                    ),),
                                  IconButton(
                      onPressed: addBook,
                      icon: Icon(Icons.add)
                    ),
                    ],),
                  ),
                ),
              Expanded( child: BookshelfList())
            ]
          ),
        )
      ),
    );
  }
}