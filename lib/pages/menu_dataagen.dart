import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:maps_route/pages/agen_detail.dart';
import '../services/api_service.dart';
import '../shared/theme.dart';

class ListBus extends StatelessWidget {
  const ListBus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Agen',
          style: boldTS,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: ApiService().fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              snapshot.data!.sort((a, b) => a.harga.compareTo(b.harga));
              snapshot.data!.sort((a, b) => a.namaPerusahaan.compareTo(b.namaPerusahaan));

              return ListView.separated(
                  separatorBuilder: (context, index) => const Gap(16),
                  padding: const EdgeInsets.all(20),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => DetailAgen(model: snapshot.data![index])),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white10,
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.directions_bus_outlined),
                            const Gap(10),
                            Expanded(child: Text(snapshot.data![index].namaPerusahaan)),
                          ],
                        ),
                      ),
                    );
                  });
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
