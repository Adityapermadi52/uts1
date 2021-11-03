import 'package:flutter/material.dart';
import 'package:latihan_mvvm/Model/Pegawai.dart';
import 'package:latihan_mvvm/Services/apiStatic.dart';
import 'package:latihan_mvvm/UI/PPL/inputPegawai.dart';
import 'package:latihan_mvvm/UI/detailPegawaiPage.dart';
import 'package:latihan_mvvm/UI/widget/buttomBar.dart';


class PegawaiPage extends StatefulWidget {
  const PegawaiPage({ Key? key }) : super(key: key);

  @override
  _PegawaiPageState createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Daftar Pegawai Loka POM"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => InputPegawai(pegawai: Pegawai(
            idPegawai: 0,
            nama: '',
            nip:'',
            alamat: '',
            telp:'',
            id_jabatan_pgw: 0,
            nama_jabatan: '',
            status: 'n',
            createdAt: '',
            updateAt: '',
            foto:''
          ))));
        },
      ),

      body: FutureBuilder<List<Pegawai>>(
        future: ApiStatic.getPegawai(),
        builder: (context, snapshot){
            if (snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else{
                List<Pegawai> listPegawai=snapshot.data!;
                return Container(
                  padding: EdgeInsets.all(5),
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index)=>Column(
                      children: [
                        InkWell(
                          onTap:  (){
                               Navigator.of(context).push(new MaterialPageRoute(
                                 builder: (BuildContext context)=>DetailPegawaiPage(pegawai: listPegawai[index],)
                                   ));
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(top: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.white,
                              border: Border.all(width: 1,color: listPegawai[index].status=='y'?Colors.green:Colors.orange)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:[
                                Image.network(ApiStatic.host+'/'+listPegawai[index].foto,width: 40,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5,right:5 ),                             
                             child: Column(
                                children:[
                                  Text(listPegawai[index].nama),
                                  Text(listPegawai[index].nama_jabatan, style: TextStyle(fontSize: 8),),
                                ],
                              ),
                              )
                              ],
                            ),
                          ),
                        )
                      ]
                    ),
                  ),
                );
            }
        },
    ),
   bottomNavigationBar: buildBottomBar(1, context)
    );
  }
}