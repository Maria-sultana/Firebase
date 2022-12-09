import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _detailsStream =FirebaseFirestore.instance.collection("blog").snapshots();
    return Scaffold(
      appBar: AppBar(title: Text("Details Page"),
      centerTitle: true,),
      body: StreamBuilder(  
        stream: _detailsStream,
        builder:(BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          } if(snapshot.hasError){
            return Text("Something is Error");
          };
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String,dynamic> data = document.data() as Map<String,dynamic>;
              return Container(
                height: 350,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    children: [
                      Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(data["img"],height: MediaQuery.of(context).size.height,),)
                      ),
                      Expanded(child:Column(
                        children: [
                          Container(child: Text(data["title"]),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            child: Text(data["des"],maxLines: 58,),
                          )
                        ],
                      )
                       )
                    ],
                  ),
                ),
              );

            }).toList(),

          );
        
        } ),
    );
  }
}