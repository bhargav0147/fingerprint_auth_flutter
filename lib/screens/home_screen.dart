import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Home Page',style: TextStyle(color: Colors.black),),backgroundColor: Colors.amber,),
      body: const Center(child: Text('Welcome to the Home Page!',style: TextStyle(color: Colors.amber),)),
    );
  }
}