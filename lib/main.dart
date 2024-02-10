import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LWK-uniffi Platform Channel Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'LWK-uniffi Platform Channel Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('demo.flutter.dev/lwk');

  String _desc = '...';
  String _address = '...';

  Future<void> _getDesc() async {
    String desc;
    try {
      final result = await platform.invokeMethod<String>('getDesc');
      if (result == null) {
        throw ("Desc is null");
      }
      desc = result;
    } on PlatformException catch (e) {
      throw ("PlatformException: ${e.message}");
    }

    setState(() {
      _desc = desc;
    });
  }

  Future<void> _getAddress() async {
    dynamic address;
    int index =1;
        try {
   final result = await platform.invokeMethod<dynamic>('getAddress',{"index":index.toString()});
     
      if (result == null) {
        throw ("Address is null");
      }
      print(result);
      address = result;
    } on PlatformException catch (e) {
      throw ("PlatformException: ${e.message}");
    }

    setState(() {
      _address = address;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _getDesc,
              child: const Text('Get Desc'),
            ),
            Text(_desc),
             ElevatedButton(
              onPressed: _getAddress,
              child: const Text('Get Address'),
            ),
            Text(_address),
          ],
        ),
      ),
    );
  }
}
