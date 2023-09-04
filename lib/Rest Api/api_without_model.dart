import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WithoutModelApi extends StatefulWidget {
  const WithoutModelApi({super.key});

  @override
  State<WithoutModelApi> createState() => _WithoutModelApiState();
}

class _WithoutModelApiState extends State<WithoutModelApi> {

  var data;
  Future<void> getUser() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if(response.statusCode==200){
      data = jsonDecode(response.body.toString());
    }else{
      Text('failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api without Model'),
      ),
      body: Column(
        children: [
Expanded(child: FutureBuilder(future: getUser(),
            builder: (context, snapshot){
  if(snapshot.connectionState== ConnectionState.waiting){
    return Text('Loading...');
  }else{
    return ListView.builder(
      itemCount: data.length,
        itemBuilder: (context,index){
      return Card(
        child: Column(
          children: [
            CustomRow(name: 'Name', value: data[index]['name'].toString()),
            CustomRow(name: 'Email', value: data[index]['email'].toString()),
            CustomRow(name: 'addres', value: data[index]['address']['city'].toString()),
          ],
        ),
      );
    });
  }
            },
))
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


