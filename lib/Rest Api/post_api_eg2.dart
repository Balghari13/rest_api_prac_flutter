import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class PostApi2 extends StatefulWidget {
  const PostApi2({super.key});

  @override
  State<PostApi2> createState() => _PostApi2State();
}

class _PostApi2State extends State<PostApi2> {

  List<Photos> photosList = [];
  Future<List<Photos>> getPhotos () async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){
       Photos photos = Photos(title: i['title'], url: i['url'], id: i['id']);
       photosList.add(photos);
      }
      return photosList;
    }else{
      return photosList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Api eg2'),
      ),
      body: Column(
        children: [
Expanded(
  child:   FutureBuilder(
    future: getPhotos(),
      builder: (context,snapshot){
    if(!snapshot.hasData){
      return Text('Loading...');
    }else{
      return ListView.builder(
        itemCount: photosList.length,
          itemBuilder: (context,index){
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(photosList[index].url),
          ),
          title: Text(photosList[index].title),
          subtitle: Text(photosList[index].id.toString()),
        );
      });
    }
  }),
)
        ],
      ),
    );
  }
}

class Photos{
  String title, url;
  int id;
  Photos({required this.title, required this.url, required this.id});
}