import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _todoList = [
    {'title': 'task1', 'complete': true},
    {'title': 'task2', 'complete': false},
  ];

  final _textController = TextEditingController();

  void _addTodo() {
    var newTodo = {};
    newTodo['title'] = _textController.text;
    newTodo['complete'] = false;
    _todoList.add(newTodo);
    _textController.text = '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(17, 1, 7, 1),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'New Todo',
                    ),
                    controller: _textController,
                  ),
                ),
                ElevatedButton(
                  onPressed: _addTodo,
                  child: const Text('Add'),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemBuilder: buildItem,
                itemCount: _todoList.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildItem(context, index) {
    return CheckboxListTile(
      value: _todoList[index]['complete'],
      onChanged: (check) {
        _todoList[index]['complete'] = check;
        setState(() {});
      },
      title: Text(_todoList[index]['title']),
      secondary: CircleAvatar(
        child: Icon(_todoList[index]['complete'] ? Icons.check : Icons.error),
      ),
    );
  }
}
