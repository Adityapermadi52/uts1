import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latihan_mvvm/Model/jabatan.dart';

import 'package:latihan_mvvm/Model/pegawai.dart';

class ApiStatic{
  static final host='http://192.168.1.5/webmobile/public';
  static final _token="9|VR2lUYFip5X8PUzJqtXliilgyyVylPMdR3pEuOch";
  static gethost(){
    return host;
  }
  static Future<List<Pegawai>> getPegawai2() async{
    List<Pegawai> pegawai=[];
    for(var i = 0; i < 8; i++){
      pegawai.add(
        Pegawai(
          idPegawai: i, nama: "Pegawai"+i.toString(), nip: "NIP Pegawai: 000000000"+i.toString(), alamat: "Alamat ", telp: "No Telp: 08596590042", foto: "", id_jabatan_pgw: 1, nama_jabatan: 'ahli madya', status: 'y',createdAt:"", updateAt: ""
          )
      );
    }
    return pegawai;
  }

  static Future<List<Pegawai>> getPegawai() async{
  //  String response='[{"id_pegawai":1,"nama":"made","nip":1905021010,"alamat":"jln.sangket","telp":"087546354975","foto":"uploads\/pegawais\/1632972981foto1.jpeg","id_jabatan_pgw":1,"status":"y","created_at":null,"updated_at":"2021-09-30T03:36:21.000000Z"},{"id_pegawai":2,"nama":"ngurah","nip":1905021098,"alamat":"jalan bukit lempuyang","telp":"087698567436","foto":"uploads\/pegawais\/1632913456Untitled-24.jpg","id_jabatan_pgw":1,"status":"y","created_at":"2021-09-29T11:04:16.000000Z","updated_at":"2021-09-30T11:51:13.000000Z"}]';
     try {
      final response= await http.get(Uri.parse("$host/api/pegawai"),
      headers: {
        'Authorization' :'Bearer'+_token,
      });
       if(response.statusCode==200){
         var json=jsonDecode(response.body);
       final parsed=json['data'].cast<Map<String,dynamic>>(); 
       return parsed.map<Pegawai>((json)=>Pegawai.fromJson(json)).toList();
       }else{
         return[];
       }
     } catch (e) {
       return[];
     }
  }
  static Future<List<Jabatan>> getJabatanPgw() async{
     try {
      final response= await http.get(Uri.parse("$host/api/jabatan_pgw"),
      headers: {
        'Authorization' :'Bearer'+_token,
      });
       if(response.statusCode==200){
         var json=jsonDecode(response.body);
       final parsed=json.cast<Map<String,dynamic>>(); 
       return parsed.map<Jabatan>((json)=>Jabatan.fromJson(json)).toList();
       }else{
         return[];
       }
     } catch (e) {
       return[];
}
  }
}