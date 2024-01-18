class CompanyModel {
  final String id;
  final String latitude;
  final String longitude;
  final String namaPerusahaan;
  final String alamat;

  CompanyModel({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.namaPerusahaan,
    required this.alamat,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'].toString(),
      latitude: json['x'].toString(),
      namaPerusahaan: json['nama_perusahaan'].toString(),
      alamat: json['alamat'].toString(),
      longitude: json['y'].toString(),
    );
  }
}
