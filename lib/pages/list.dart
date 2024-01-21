import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_route/models/company_model.dart';
import 'package:maps_route/pages/maps.dart';
import 'package:maps_route/services/api_service.dart';
import 'package:maps_route/shared/method.dart';
import 'package:maps_route/widgets/bus_card.dart';

import '../shared/theme.dart';

class ListLocation extends StatelessWidget {
  final int priceRequest;
  const ListLocation({super.key, required this.priceRequest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Aplikasi Mapping',
          style: boldTS,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiService().fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Create new List
            List<CompanyModel> filtered = [];

            // Check in every element
            // Add element with price <= price request
            for (CompanyModel data in snapshot.data!) {
              if (int.tryParse(data.harga)! <= priceRequest) {
                filtered.add(data);
              }
            }

            // Sort by cheapest price
            filtered.sort((a, b) => a.harga.compareTo(b.harga));

            // If list is empty, pass 'No data found.'
            if (filtered.isEmpty) {
              return Center(
                child: Text(
                  'No data found.',
                  style: mediumTS,
                ),
              );
            }

            // Pass the data to BusCard
            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                return BusCard(
                  model: filtered[index],
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => Maps(
                          destination: LatLng(
                            double.tryParse(filtered[index].latitude)!,
                            double.tryParse(filtered[index].longitude)!,
                          ),
                          locationName: filtered[index].namaPerusahaan,
                          topsis: randomDouble(),
                        ),
                      ),
                    );
                  },
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
