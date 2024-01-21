import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:maps_route/models/company_model.dart';
import 'package:maps_route/shared/theme.dart';

class BusCard extends StatelessWidget {
  final CompanyModel model;
  final VoidCallback? onTap;
  const BusCard({super.key, required this.model, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${model.namaPerusahaan} - Rp ${model.harga}',
                  style: semiboldTS.copyWith(fontSize: 20),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                )
              ],
            ),
            const Gap(18),
            Text(
              model.alamat,
              style: mediumTS,
              textAlign: TextAlign.justify,
            ),
            const Gap(30),
            Text(
              'Fasilitas: ${model.namaFasilitas}',
              style: regularTS,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
