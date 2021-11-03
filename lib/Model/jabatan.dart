class Jabatan{
  Jabatan({
      required this.id_jabatan_pgw,
      required this.nama_jabatan,
  });
  int id_jabatan_pgw;
  String nama_jabatan;
  factory Jabatan.fromJson(Map<String,dynamic> json) => Jabatan(
    id_jabatan_pgw: json["id_jabatan_pgw"],
    nama_jabatan: json["nama_jabatan"]==null?'':json["nama_kelompok"].toString()
    );
  Map<String,dynamic> toJson() => {
    "id_jabatan_pgw": id_jabatan_pgw,
    "nama_jabatan": nama_jabatan,
  };
}