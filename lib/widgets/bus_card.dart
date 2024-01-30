import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../models/company_model.dart';
import '../shared/theme.dart';

class BusCard extends StatelessWidget {
  final CompanyModel model;
  final VoidCallback? onTap;
  const BusCard({super.key, required this.model, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).focusColor,
                image: DecorationImage(
                  image: NetworkImage(model.foto),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Gap(14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '${model.namaPerusahaan} - Rp ${model.harga}',
                    style: semiboldTS.copyWith(fontSize: 20),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                )
              ],
            ),
            const Gap(5),
            Text(
              '${model.namaPelayanan} (${model.namaWaktu})',
              style: semiboldTS.copyWith(fontSize: 18),
            ),
            const Gap(10),
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
            const Gap(8),
            Text(
              'Keamanan: ${model.namaKeamanan}',
              style: regularTS,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
