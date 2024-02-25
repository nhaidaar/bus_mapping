class CompanyModel {
  final String id;
  final String latitude;
  final String longitude;
  final String namaPerusahaan;
  final String foto;
  final String alamat;
  final String harga;
  final String namaFasilitas;
  final String namaKeamanan;
  final String namaPelayanan;
  final String namaWaktu;
  final String bobot;

  CompanyModel({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.namaPerusahaan,
    required this.foto,
    required this.alamat,
    required this.harga,
    required this.namaFasilitas,
    required this.namaKeamanan,
    required this.namaPelayanan,
    required this.namaWaktu,
    required this.bobot,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'].toString(),
      latitude: json['x'].toString(),
      namaPerusahaan: json['nama_perusahaan'].toString(),
      harga: json['harga'].toString(),
      namaFasilitas: json['nama_fasilitas'].toString(),
      namaKeamanan: json['nama_keamanan'].toString(),
      namaPelayanan: json['nama_pelayanan'].toString(),
      namaWaktu: json['nama_waktu'].toString(),
      alamat: json['alamat'].toString(),
      bobot: json['bobot'].toString(),
      foto: json['foto'].toString(),
      longitude: json['y'].toString(),
    );
  }
}
