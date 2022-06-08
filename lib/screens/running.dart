import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../attendant/world_durations.dart';

class Running extends StatefulWidget {
  const Running({Key? key}) : super(key: key);

  @override
  State<Running> createState() => _RunningState();
}

class _RunningState extends State<Running> {
  void buildWorldTime() async {
    WorldDuration imagine = WorldDuration(
        where: 'Lagos', identity: 'nigeria.png', link: 'Africa/Lagos');
    await imagine.takeAkoko();

    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/base', arguments: {
      'where': imagine.where,
      'identity': imagine.identity,
      'when': imagine.when,
      'isBright': imagine.isBright,
    });
  }

  @override
  void initState() {
    super.initState();
    buildWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.tealAccent,
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.teal,
          size: 100.0,
        ),
      ),
    );
  }
}