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
  TextEditingController _editingController = TextEditingController();

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
        onPressed: () {
          /*ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Clicou no action button'),
              action: SnackBarAction(
                label: 'Desfazer',
                onPressed: () {
                  print('clicou no desfazer');
                },
              ),
            ),
          );*/
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Título do alerta'),
                content: Text('Conteúdo do alerta'),
                actions: [
                  TextField(
                    controller: _editingController,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      print(_editingController.text);
                    },
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
