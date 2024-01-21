class CompanyModel {
  final String id;
  final String latitude;

  final String longitude;
  final String namaPerusahaan;
  final String alamat;
  final String harga;
  final String namaFasilitas;

  CompanyModel({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.namaPerusahaan,
    required this.alamat,
    required this.harga,
    required this.namaFasilitas,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'].toString(),
      latitude: json['x'].toString(),
      harga: json['harga'].toString(),
      namaFasilitas: json['nama_fasilitas'].toString(),
      namaPerusahaan: json['nama_perusahaan'].toString(),
      alamat: json['alamat'].toString(),
      longitude: json['y'].toString(),
    );
  }
}
