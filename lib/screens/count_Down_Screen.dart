import 'package:flutter/material.dart';
import '../main.dart';

class CountDownScreen extends StatefulWidget {
  const CountDownScreen ({super.key});
  
  @override
  State<StatefulWidget> createState() => CountDown();


}

class CountDown extends State<CountDownScreen>{

  int _number = 0;
  int _count = 0;
  bool setZero = false;

  void reload() => setState(() {
    _count = 0;
    setZero = true;
  });

  void substractOne() => setState(() {
    _number--;
    setZero = false;
  });

  @override
  Widget build(BuildContext context) {
    Params params = ModalRoute.of(context)?.settings.arguments != null ? ModalRoute.of(context)!.settings.arguments as Params : Params(0, isUsed: true);
    _count = setZero ? 0 : params.count + _number;
    _number = _count <= 0 ? params.count * (-1) + 1 : _number;
    return Scaffold (
        appBar: AppBar(
          backgroundColor: Colors.tealAccent.shade400,
          title: const Text('Contar decendente'),
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
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orange.shade400)
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'countUp',arguments: Params(_count,isUsed: true)).
                    then((value) {
                      if (value != null){
                        setState(() {
                          _number = value as int;
                        });
                      }
                    });
                },
                child: const Text('Aumentar')
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
                backgroundColor: Colors.tealAccent.shade400,
                onPressed: substractOne,
                child: const Text(
                  '-',
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                ),
              ),
            )
          ],
        )
      );
  }
}