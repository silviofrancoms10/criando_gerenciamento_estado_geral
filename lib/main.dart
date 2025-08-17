import 'package:criando_gerenciamento_estado/classes/counter_state.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
      final counterState = CounterState();
  @override
  void initState() {
    counterState.addListener(callback);
    super.initState();
  }
  
  void callback(){
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gerenciamento de estado')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Valor do estado: ${counterState.counter}"),
            ElevatedButton(onPressed: () {
              counterState.increment();
            }, child: const Text("Incrementar"))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    counterState.removeListener(callback);
    super.dispose();
  }
}
