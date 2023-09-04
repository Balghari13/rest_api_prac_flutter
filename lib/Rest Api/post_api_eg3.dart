import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_api_prac/Models/UserModel.dart';
import 'package:http/http.dart' as http;
class PostApi3 extends StatefulWidget {
  const PostApi3({super.key});

  @override
  State<PostApi3> createState() => _PostApi3State();
}

class _PostApi3State extends State<PostApi3> {
  
  List<UserModel> userList = [];
  Future<List<UserModel>> getUser() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    }
    return userList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Api 3'),
      ),
      body: Column(
        children: [
Expanded(child:
FutureBuilder(future: getUser(),
  builder: (context, AsyncSnapshot<List<UserModel>> snapshot){
  if(!snapshot.hasData){
    return Text('Loading...');
  }else{
  return ListView.builder(
    itemCount: userList.length,
      itemBuilder: (context,index){
    return Card(
       child: Column(
         children: [
           CustomRow(name: 'Name', value: snapshot.data![index].name.toString(),),
           CustomRow(name: 'User Name', value: snapshot.data![index].username.toString(),),
           CustomRow(name: 'Email', value: snapshot.data![index].email.toString()),
           CustomRow(name: 'City', value: snapshot.data![index].address!.city.toString()),
         ],
       ),
    );
  });
  }

},)
),
        ],
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  String name, value;
   CustomRow({super.key, required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          Text(value),
        ],
      ),
    );
  }
}

