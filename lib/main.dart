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

  // List<String> rowItens = List<String>.generate(50, (index) => 'Número gerado na posição $index');

  List<Widget> rowItems = [];

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
      body: ListView.builder(
        itemCount: this.rowItems.length,
        itemBuilder: (BuildContext context, int position) {
          return rowItems[position];
        },
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
                title: Text('Nova tarefa'),
                content: Text('Informe o título da tarefa'),
                actions: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextField(
                      controller: _editingController,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(textStyle: TextStyle(fontWeight: FontWeight.bold,)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancelar', style: TextStyle(color: Colors.red),),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            rowItems.add(RowItem(title: _editingController.text,));
                            _editingController.text = '';
                          });
                        },
                        child: Text('Ok'),
                      ),
                    ],
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

class RowItem extends StatefulWidget {
  RowItem({Key? key, required this.title, this.isDone = false}) : super(key: key);

  String title;
  bool isDone;

  @override
  State<RowItem> createState() => _RowItemState();
}

class _RowItemState extends State<RowItem> {

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
/*      subtitle: Text('Subtitle'),
      leading: Icon(Icons.favorite),
      trailing: Icon(Icons.done),*/
      trailing: widget.isDone ? Icon(Icons.done): null,
      selected: true,
      onTap: () {
        setState(() {
          widget.isDone = !widget.isDone;
        });
      },
    );
  }
}
