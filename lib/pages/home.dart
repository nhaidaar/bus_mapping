import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:maps_route/pages/list.dart';
import 'package:maps_route/services/maps_service.dart';
import 'package:maps_route/shared/theme.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hai, Naufal Haidar 👋',
                style: semiboldTS.copyWith(fontSize: 24),
              ),
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Lokasi Anda : ',
                    style: mediumTS.copyWith(fontSize: 15),
                  ),
                  const Gap(10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).highlightColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: FutureBuilder(
                        future: MapsService().getUserCurrentPosition(),
                        builder: (context, position) {
                          if (position.hasData) {
                            return FutureBuilder(
                              future: MapsService()
                                  .getFullAddressFromPosition(position.data!),
                              builder: (context, address) {
                                if (address.hasData) {
                                  return Text(
                                    address.data.toString(),
                                    style: mediumTS,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  );
                                }
                                return const Text('-');
                              },
                            );
                          }
                          return const Text('-');
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tujuan Anda : ',
                    style: mediumTS.copyWith(fontSize: 15),
                  ),
                  const Gap(10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).highlightColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Aceh',
                        style: mediumTS,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Harga (Rp) : ',
                    style: mediumTS.copyWith(fontSize: 15),
                  ),
                  const Gap(10),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).highlightColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ListLocation(),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Theme.of(context).focusColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Text(
                        'LANJUTKAN',
                        style: semiboldTS.copyWith(fontSize: 20),
                      ),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
