import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../models/filter_model.dart';
import '../shared/theme.dart';
import '../shared/value.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_field.dart';
import 'list.dart';

class MenuPencarian extends StatefulWidget {
  const MenuPencarian({super.key});

  @override
  State<MenuPencarian> createState() => _MenuPencarianState();
}

class _MenuPencarianState extends State<MenuPencarian> {
  String fasilitas = listFasilitas.first;
  String pelayanan = listPelayanan.first;
  String keamanan = listKeamanan.first;
  String waktu = listWaktu.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pencarian',
          style: boldTS,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(40),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Fasilitas : ',
                style: mediumTS.copyWith(fontSize: 15),
              ),
              const Gap(10),
              Expanded(
                child: CustomDropdownField(
                  items: List.generate(listFasilitas.length, (index) {
                    return DropdownMenuItem(
                      value: listFasilitas[index],
                      child: Text(listFasilitas[index]),
                    );
                  }),
                  onChanged: (value) {
                    setState(() {
                      fasilitas = value;
                    });
                  },
                ),
              ),
            ],
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pelayanan : ',
                style: mediumTS.copyWith(fontSize: 15),
              ),
              const Gap(10),
              Expanded(
                child: CustomDropdownField(
                  items: List.generate(listPelayanan.length, (index) {
                    return DropdownMenuItem(
                      value: listPelayanan[index],
                      child: Text(listPelayanan[index]),
                    );
                  }),
                  onChanged: (value) {
                    setState(() {
                      pelayanan = value;
                    });
                  },
                ),
              ),
            ],
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Keamanan : ',
                style: mediumTS.copyWith(fontSize: 15),
              ),
              const Gap(10),
              Expanded(
                child: CustomDropdownField(
                  items: List.generate(listKeamanan.length, (index) {
                    return DropdownMenuItem(
                      value: listKeamanan[index],
                      child: Text(listKeamanan[index]),
                    );
                  }),
                  onChanged: (value) {
                    setState(() {
                      keamanan = value;
                    });
                  },
                ),
              ),
            ],
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Waktu : ',
                style: mediumTS.copyWith(fontSize: 15),
              ),
              const Gap(10),
              Expanded(
                child: CustomDropdownField(
                  items: List.generate(listWaktu.length, (index) {
                    return DropdownMenuItem(
                      value: listWaktu[index],
                      child: Text(listWaktu[index]),
                    );
                  }),
                  onChanged: (value) {
                    setState(() {
                      waktu = value;
                    });
                  },
                ),
              ),
            ],
          ),
          const Gap(40),
          CustomButtonWithArrow(
              text: 'LANJUTKAN',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ListLocation(
                      model: FilterModel(
                        fasilitas: fasilitas,
                        keamanan: keamanan,
                        pelayanan: pelayanan,
                        waktu: waktu,
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
