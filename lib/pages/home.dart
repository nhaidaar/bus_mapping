import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_route/pages/maps.dart';
import 'package:maps_route/services/api_service.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
      body: FutureBuilder(
        future: ApiService().fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => Maps(
                          destination: LatLng(
                            double.tryParse(snapshot.data![index].latitude)!,
                            double.tryParse(snapshot.data![index].longitude)!,
                          ),
                        ),
                      ),
                    );
                  },
                  title: Text(snapshot.data![index].namaPerusahaan),
                  subtitle: Text(snapshot.data![index].alamat),
                  trailing: const Icon(Icons.arrow_forward_ios),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
