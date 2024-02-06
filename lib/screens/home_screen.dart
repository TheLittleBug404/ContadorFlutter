import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int c = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Este es un App Bar'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, //esta propiedad nos movera la column
          children: <Widget>[
            const Text("Contador",
                style: TextStyle(
                    fontSize: 34,
                    color: Colors.blueAccent,
                    fontStyle: FontStyle.italic)),
            AnimatedFlipCounter(
              duration: const Duration(milliseconds:500),
              value: c,
              textStyle:const  TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: _buttons(),
    );
  }

  Widget _buttons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                setState(() => c++);
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: FloatingActionButton(
              child:  Icon(Icons.remove),
              backgroundColor: Colors.red,
              onPressed: () {
                setState(() {
                  if(c<0){
                    print("no puede reducir de cero");
                  }
                  else{
                    c--;
                  }
                });
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: FloatingActionButton(
              child: const Icon(Icons.ac_unit_sharp),
              backgroundColor: Colors.greenAccent,
              onPressed: () {
                setState(() => c = 0);
              }),
        ),
      ],
    );
  }
}
