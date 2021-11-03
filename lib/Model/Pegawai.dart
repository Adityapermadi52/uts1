class Pegawai{
  Pegawai({
      required this.idPegawai,
      required this.nama,
      required this.nip,
      required this.alamat,
      required this.telp,
      required this.foto,
      required this.id_jabatan_pgw,
      required this.status,
      required this.nama_jabatan,
      required this.createdAt,
      required this.updateAt,
  });
  int idPegawai;
  String nama;
  String nip;
  String alamat;
  String telp;
  String foto;
  int id_jabatan_pgw;
  String status;
  String nama_jabatan;
  String createdAt;
  String updateAt;

  factory Pegawai.fromJson(Map<String, dynamic> json) => Pegawai(
    idPegawai: json["id_pegawai"],
    nama: json["nama"].toString(),
    nip: json["nip"].toString(),
    alamat: json["alamat"].toString(),
    telp: json["telp"].toString(),
    foto: json["foto"].toString(),
    id_jabatan_pgw: json["id_jabatan_pgw"],
    status: json["status"].toString(),
    nama_jabatan: json["nama_jabatan"].toString(),
    createdAt: json["createdAt"].toString(),
    updateAt: json["updateAt"].toString(),
  );
}