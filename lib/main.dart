import 'package:flutter/material.dart';
import 'package:(•◡•)project-name(•◡•)/sdk/backend_service.dart';

void main() {
  runApp(MyApp());
}

@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Genezio + Flutter',
    home: SayHelloPage(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SVG Example',
      home: SayHelloPage(),
    );
  }
}

class SayHelloPage extends StatefulWidget {
  @override
  _SayHelloPageState createState() => _SayHelloPageState();
}

class _SayHelloPageState extends State<SayHelloPage> {
  final TextEditingController _nameController = TextEditingController();
  String _greeting = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genezio + Flutter',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Genezio + Flutter = ❤️',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                width: 200,
                child: TextField(
                  controller: _nameController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: 'Enter your name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              _greeting, // Display the greeting message
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String name = _nameController.text;
                if (name.isNotEmpty) {
                  String response = await BackendService.hello(name);
                  setState(() {
                    _greeting = response;
                  });
                } else {
                  setState(() {
                    _greeting = 'Please enter your name!';
                  });
                }
              },
              child: Text('Say Hello'),
            ),
          ],
        )),
      ),
    );
  }
}
