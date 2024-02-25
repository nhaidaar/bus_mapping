import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/company_model.dart';
import '../models/filter_model.dart';
import '../pages/maps.dart';
import '../services/api_service.dart';
import '../shared/theme.dart';
import '../widgets/bus_card.dart';

class ListLocation extends StatelessWidget {
  final FilterModel model;
  const ListLocation({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mapping',
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
              if (data.namaFasilitas == model.fasilitas &&
                  data.namaPelayanan == model.pelayanan &&
                  data.namaKeamanan == model.keamanan &&
                  data.namaWaktu == model.waktu) {
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
                          topsis: filtered[index].bobot,
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
