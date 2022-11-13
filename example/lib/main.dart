import 'package:flutter/material.dart';
import 'package:plugin_device_info/plugin_device_info.dart';

void main(List<String> args) {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomePage> {
  String resultBottom = 'отримати';
  bool resultInfo = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(150, 106, 106, 69),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Бажаєте отримати інформацію о пристрої?',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (resultBottom == 'отримати') {
                      resultBottom = 'скрити';
                      resultInfo = true;
                    } else {
                      resultBottom = 'отримати';
                      resultInfo = false;
                    }
                  });
                },
                child: Text(resultBottom),
              ),

              const SizedBox(
                height: 10,
              ),

              // info device
              resultInfo == true ? const PluginDeviceInfo() : Container()
            ],
          ),
        ),
      ),
    );
  }
}
