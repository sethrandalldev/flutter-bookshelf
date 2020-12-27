import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookshelfList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference books = FirebaseFirestore.instance.collection('books');

    deleteBook(DocumentSnapshot doc) {
      books
        .doc(doc.id)
        .delete()
        .then((value) => print("Book deleted"))
        .catchError((error) => print("Failed to delete book: $error"));
    }

    return StreamBuilder<QuerySnapshot>(
      stream: books.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading Books");
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return new ListTile(
              title: new Text(document.data()['title']),
              subtitle: new Text(document.data()['author']),
              trailing: IconButton(icon: Icon(Icons.delete), onPressed: () => deleteBook(document),)
            );
          }).toList(),
        );
      },
    );
  }
}