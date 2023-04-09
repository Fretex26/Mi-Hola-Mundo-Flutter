import 'package:flutter/material.dart';
import '../main.dart';

class CountUpScreen extends StatefulWidget {
  const CountUpScreen ({super.key});
  
  @override
  State<StatefulWidget> createState() => CountUp();


}

class CountUp extends State<CountUpScreen>{

  int _number = 0;
  int _count = 0;
  bool setZero = false;

  void reload() => setState(() {
    _number = 0;
    _count = 0;
    setZero = true;
  });

  void addOne() => setState(() {
    _number++;
    setZero = false;
  });

  @override
  Widget build(BuildContext context) {
    Params params = ModalRoute.of(context)?.settings.arguments != null ? ModalRoute.of(context)!.settings.arguments as Params : Params(0,isUsed: false);
    _count = setZero ? 0 : params.isUsed ? params.count + _number : _number;
    return Scaffold (
        appBar: AppBar(
          backgroundColor: Colors.orange.shade400,
          title: const Text('Contar acendente'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$_count',
                style: const TextStyle(
                  fontSize: 160.0,
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.tealAccent.shade400)
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'countDown', arguments: Params(_count,isUsed: true)).
                    then((value) {
                      if (value != null){
                        setState(() {
                          _number = value as int;
                        });
                      }
                    });
                },
                child: const Text('Disminuir')
              )
            ],
          ),
        ),
        floatingActionButton: Stack(
          children: <Widget>[
            Positioned(
              left: 48.0,
              bottom: 16.0,
              child: FloatingActionButton(
                heroTag: 'reload',
                backgroundColor: Colors.purple.shade400,
                onPressed: reload,
                child: const Icon(Icons.repeat_sharp),
              ),
            ),
            Positioned(
              right: 16.0,
              bottom: 16.0,
              child: FloatingActionButton(
                heroTag: 'addOne',
                backgroundColor: Colors.orange.shade400,
                onPressed: addOne,
                child: const Icon(Icons.add),
              ),
            )
          ],
        )
      );
  }
}