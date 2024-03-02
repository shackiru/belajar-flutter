import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("chats").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
        if(snapshot.hasError)
        {
          return Center(
            child: Text("Something went wrong"),
          );
        }
        if(snapshot.connectionState == ConnectionState.waiting)
        {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if(snapshot.hasData)
        {
          return CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                largeTitle: Text("Chats"),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                snapshot.data!.docs.map((DocumentSnapshot document)
                {
                Map<String, dynamic>;
                return CupertinoListTile(
                  title: Text(document['title']),
                  );
                }).toList()
              ))
            ],
          );
        }
        return Container();
      });
    // return CustomScrollView
    // (
    //   slivers:
    //   [
    //     CupertinoSliverNavigationBar
    //     (
    //       largeTitle: Text("Chats"),
    //     ),  
    //     SliverList
    //     (
    //       delegate: 
    //       (
    //           SliverChildListDelegate
    //         (
    //           [
    //             CupertinoListTile
    //             (
    //               title: Text("Chat 1"),
    //             ),
    //             CupertinoListTile
    //             (
    //               title: Text("Chat 1"),
    //             ),
    //             CupertinoListTile
    //             (
    //               title: Text("Chat 1"),
    //             ),
    //             CupertinoListTile
    //             (
    //               title: Text("Chat 1"),
    //             ),
    //           ]
    //         )
    //       )
    //     )
    //   ]
    // );
  }
}