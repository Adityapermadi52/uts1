import 'package:flutter/material.dart';
import 'package:latihan_mvvm/Model/Pegawai.dart';
import 'package:latihan_mvvm/Model/errMsg.dart';
import 'package:latihan_mvvm/Model/jabatan.dart';
import 'package:latihan_mvvm/Services/apiStatic.dart';

class InputPegawai extends StatefulWidget {
    final Pegawai pegawai;
  InputPegawai({required this.pegawai});
  @override
  _InputPegawaiState createState() => _InputPegawaiState();
}

class _InputPegawaiState extends State<InputPegawai> {
  final _formkey=GlobalKey<FormState>();
  late TextEditingController nama,nip,alamat,telp;
  late List<Jabatan> _jabatan=[];
  late int idJabatan=0;
  late int idPegawai=0;
  bool _isupdate=false;
  bool _validate=false;
  late ErrorMSG response;
  late String _status='n';
  get id_jabatan_pgw => null;

  void getJabatan() async{
    final response =await ApiStatic.getJabatanPgw();
    setState((){
      _jabatan=response.toList();
    });
  }
  @override
  void initState() {
    nama =TextEditingController();
    nip=TextEditingController();
    alamat=TextEditingController();
    telp= TextEditingController();
    getJabatan();
     if(widget.pegawai.idPegawai!=0){
     }
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: _isupdate ? Text('Ubah Data') : Text('Input Data'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
        key: _formkey,
        child: Column(
          children: [
            Padding(
             padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: nama,
                      validator: (u) => u == "" ? "Wajib Disis" : null,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.perm_identity),
                           hintText: "Nama Pegawai",
                          labelText: 'Nama Pegawai',
                          ),
                    ),
                  ),

          Padding(
             padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: nip,
                      validator: (u) => u == "" ? "Wajib Disis" : null,
                      keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.perm_identity),
                           hintText: "NIP Pegawai",
                          labelText: 'NIP Pegawai',
                          ),
                    ),
                  ),
          
          Padding(
            padding: EdgeInsets.all(5),
            child: DropdownButtonFormField(
              value: idJabatan==0?null:idJabatan,
              hint: Text("pilih Jabatan"),
              decoration:  const InputDecoration(
                icon:Icon(Icons.category_rounded),
              ),
              items: _jabatan.map((item) {
                return DropdownMenuItem(
                  child: Text(item.nama_jabatan),
                  value: item.id_jabatan_pgw.toInt(),
                );
              }).toList(),
                onChanged: (value){
                  setState((){
                   idJabatan=value as int;
                  });
                },
                validator: (u) => u == null ? "Wajib Diisi" : null,
          ),
          ),

           Padding(
             padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: telp,
                      keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.perm_identity),
                           hintText: "Nomor HP",
                          labelText: 'Nomor HP',
                          ),
                          validator: (u) => u == "" ? "Wajib Disis" : null,
                    ),
                  ),

           Padding(
             padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: alamat,
                      keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.perm_identity),
                           hintText: "Alamat",
                          labelText: 'Alamat Pegawai',
                          ),
                          validator: (u) => u == "" ? "Wajib Disis" : null,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(bottom: 10, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.visibility),
                        Row(
                          children: <Widget>[
                            new Radio(
                              value: "y", 
                              groupValue: _status, 
                              onChanged: (String? newValue){
                                setState((){
                                  _status = newValue!.toString();
                                });
                              },
                              ),
                              new Text(
                                'Aktif'
                              ),
                              new Radio(
                                value: "n", 
                                groupValue: _status, 
                                onChanged: (String? newValue){
                                  setState((){
                                      _status = newValue!.toString();
                                });
                                },
                              ),
                              new Text(
                                  'Tidak'
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Divider(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                      child: RaisedButton(
                      color:Colors.green,
                      child: Text(
                        'SIMPAN',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: (){
                            // submit();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                      ),
                  ),

         ],
      ),
        ),
      ),
    );
}
}