import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maps_route/pages/maps.dart';
import 'package:maps_route/shared/place.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Maps',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ...List.generate(place.length, (index) {
            return ListTile(
              onTap: () async {
                await Geolocator.requestPermission();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => MapsPage(
                      latitude: place[index]['latitude'],
                      longitude: place[index]['longitude'],
                    ),
                  ),
                );
              },
              title: Text(place[index]['title'].toString()),
              subtitle: Text(place[index]['subtitle'].toString()),
              trailing: const Icon(Icons.arrow_forward_ios),
            );
          })
        ],
      ),
    );
  }
}
