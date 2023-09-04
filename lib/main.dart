import 'package:flutter/material.dart';
import 'package:rest_api_prac/Rest%20Api/complex_api.dart';
import 'package:rest_api_prac/Rest%20Api/post_api_eg1.dart';
import 'package:rest_api_prac/Rest%20Api/post_api_eg2.dart';
import 'package:rest_api_prac/Rest%20Api/api_without_model.dart';

import 'Rest Api/post_api_eg3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
       // useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rest API's"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context)=>const WithoutModelApi(),
                ),
              );
            }, child: const Text('Practices'),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>const PostApi1(),
                  ),
              );
            }, child: const Text('Post Api eg 01'),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context)=>const PostApi2(),
                ),
              );
            }, child: const Text('Post Api eg 02'),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context)=>const PostApi3(),
                ),
              );
            }, child: const Text('Post Api eg 03'),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context)=>const ComplexApi(),
                ),
              );
            }, child: const Text('Complex Post Api'),
            ),
          ],
        ),
      ),
    );
  }
}
