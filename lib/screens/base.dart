import 'package:flutter/material.dart';

class Base extends StatefulWidget {
  const Base({Key? key}) : super(key: key);

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  Map files = {};
  @override
  Widget build(BuildContext context) {
    files = files.isNotEmpty
        ? files
        : ModalRoute.of(context)?.settings.arguments as Map;
    //print(files);

    String bgpinsures = files['isBright'] ? 'day.png' : 'night.png';
    Color bgPaint = files['isBright'] ? Colors.white : Colors.black;
    return Scaffold(
      backgroundColor: bgPaint,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('pishures/$bgpinsures'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic score =
                        await Navigator.pushNamed(context, '/places');
                    setState(() {
                      files = {
                        'when': score['when'],
                        'where': score['where'],
                        'identity': score['identity'],
                        'isBright': score['isBright'],
                      };
                    });
                  },
                  icon: const Icon(Icons.edit_location),
                  label: const Text('Edit Location'),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      files['where'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Text(
                  files['when'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}