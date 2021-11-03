import 'package:flutter/material.dart';
import 'package:latihan_mvvm/UI/widget/buttomBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),    
      body: Center(
        child: Text("Home Page"),
      ),
      bottomNavigationBar: buildBottomBar(0, context),
      
    );
  }
}