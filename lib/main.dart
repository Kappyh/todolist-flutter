import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas para hoje'),
/*        actions: [
          InkWell(
            onTap: (){
              print('buscar');
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(Icons.search),
            ),
          ),
          InkWell(
            onTap: (){
              print('buscar');
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(Icons.add),
            ),
          ),
        ],*/
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print('fab');
        },
        child: Icon(Icons.add) ,
      ),
    );
  }
}
