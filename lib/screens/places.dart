import 'package:flutter/material.dart';

import '../attendant/world_durations.dart';

class Places extends StatefulWidget {
  const Places({Key? key}) : super(key: key);

  @override
  State<Places> createState() => _PlacesState();
}

class _PlacesState extends State<Places> {
  List<WorldDuration> places = [
    WorldDuration(link: 'Europe/London', where: 'London', identity: 'uk.png'),
    WorldDuration(
        link: 'Europe/Berlin', where: 'Berlin', identity: 'germany.png'),
    WorldDuration(link: 'Africa/Cairo', where: 'Cairo', identity: 'egypt.png'),
    WorldDuration(
        link: 'Africa/Nairobi', where: 'Nairobi', identity: 'kenya.png'),
    WorldDuration(
        link: 'Africa/Lagos', where: 'Lagos', identity: 'nigeria.png'),
    WorldDuration(
        link: 'America/New_York', where: 'New York', identity: 'usa.png'),
    WorldDuration(
        link: 'Asia/Jakarta', where: 'Jakarta', identity: 'indonesia.png'),
    WorldDuration(
        link: 'America/Chicago', where: 'Chicago', identity: 'usa.png'),
    WorldDuration(
        link: 'Asia/Seoul', where: 'Seoul', identity: 'south_korea.png'),
    WorldDuration(
        link: 'Europe/Athens', where: 'Athens', identity: 'greece.png'),
  ];

  void progressDuration(index) async {
    WorldDuration imagine = places[index];
    await imagine.takeAkoko();

    if (!mounted) return;

    Navigator.pop(context, {
      'where': imagine.where,
      'identity': imagine.identity,
      'when': imagine.when,
      'isBright': imagine.isBright,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: places.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
              child: Card(
                child: ListTile(
                  onTap: () {
                    progressDuration(index);
                  },
                  title: Text(places[index].where),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('pishures/${places[index].identity}'),
                  ),
                ),
              ),
            );
          }),
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Select a Place'),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}