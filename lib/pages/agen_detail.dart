import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_route/models/company_model.dart';
import 'package:maps_route/widgets/custom_button.dart';

import '../shared/method.dart';
import '../shared/theme.dart';
import 'maps.dart';

class DetailAgen extends StatelessWidget {
  final CompanyModel model;
  const DetailAgen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          model.namaPerusahaan,
          style: boldTS,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(model.foto),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap(40),
          Text(
            'Waktu',
            style: semiboldTS.copyWith(fontSize: 16),
          ),
          Text(
            model.namaWaktu,
            style: mediumTS,
          ),
          const Gap(10),
          Text(
            'Pelayanan',
            style: semiboldTS.copyWith(fontSize: 16),
          ),
          Text(
            model.namaPelayanan,
            style: mediumTS,
          ),
          const Gap(10),
          Text(
            'Fasilitas',
            style: semiboldTS.copyWith(fontSize: 16),
          ),
          Text(
            model.namaFasilitas,
            style: mediumTS,
          ),
          const Gap(10),
          Text(
            'Keamanan',
            style: semiboldTS.copyWith(fontSize: 16),
          ),
          Text(
            model.namaKeamanan,
            style: mediumTS,
          ),
          const Gap(10),
          Text(
            'Harga',
            style: semiboldTS.copyWith(fontSize: 16),
          ),
          Text(
            'Rp${model.harga}',
            style: mediumTS,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        height: 100,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: CustomButtonWithArrow(
            text: 'MENUJU LOKASI',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => Maps(
                    destination: LatLng(
                      double.tryParse(model.latitude)!,
                      double.tryParse(model.longitude)!,
                    ),
                    locationName: model.namaPerusahaan,
                    topsis: randomDouble(),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
