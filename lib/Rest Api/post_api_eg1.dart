import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/PostModel.dart';

class PostApi1 extends StatefulWidget {
  const PostApi1({super.key});
  

  @override
  State<PostApi1> createState() => _PostApi1State();
}

class _PostApi1State extends State<PostApi1> {
  List<PostModel> postList = [];
  Future<List<PostModel>> getPostApi()  async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      postList.clear();
      for(Map i in data){
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    }
    return postList;
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Api Eg1'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
                builder: (context,snapshot){
              if(!snapshot.hasData){
                return Text('Loading...');
              }else{
                return ListView.builder(
                  itemCount: postList.length,
                    itemBuilder: (context, index){
                  return Card(child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Title\n'+postList[index].title.toString()),
                        Text('Body\n${postList[index].body}'),
                      ],
                    ),
                  ));
                });
              }
            }),
          )
        ],
      ),
    );
  }
}
