import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfile createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  final database = FirebaseDatabase.instance.reference();

  final items = ['Laki - Laki', 'Perempuan'];
  String? value;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final user = FirebaseAuth.instance.currentUser!;
    final namaController = TextEditingController(text: user.displayName!);
    final tinggiController = TextEditingController(text: '166');
    final beratController = TextEditingController(text: '60');
    final noTelpController = TextEditingController(text: '082292858310');
    final alamatController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mPrimaryColor,
        title: Text("Ubah Profil",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 40),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      //  margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
                      child: Center(
                        child: Icon(
                          Icons.account_circle_outlined,
                          size: 130,
                          color: Colors.grey.withOpacity(0.50),
                        ),
                      ),
                    ),
                    Text(
                      'Nama Lengkap:',
                      style:
                          TextStyle(color: mSecondaryTextColor, fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: namaController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Tanggal Lahir:',
                      style:
                          TextStyle(color: mSecondaryTextColor, fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Jenis Kelamin:',
                      style:
                          TextStyle(color: mSecondaryTextColor, fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      width: size.width,
                      height: 55,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(3)),
                      child: DropdownButton<String>(
                          hint: Text(
                            'Laki-Laki/Perempuan',
                            style: TextStyle(fontSize: 16),
                          ),
                          value: value,
                          isExpanded: true,
                          items: items.map(builMenuItem).toList(),
                          onChanged: (value) => setState(() {
                                this.value = value;
                              })),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Tinggi Badan:',
                      style:
                          TextStyle(color: mSecondaryTextColor, fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: tinggiController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Berat Badan:',
                      style:
                          TextStyle(color: mSecondaryTextColor, fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: beratController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Nomor Telepon:',
                      style:
                          TextStyle(color: mSecondaryTextColor, fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: noTelpController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Alamat:',
                      style:
                          TextStyle(color: mSecondaryTextColor, fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: alamatController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.streetAddress,
                      maxLines: 1,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/profil');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: mPrimaryColor,
                          minimumSize: Size(size.width, 45),
                        ),
                        child: Text(
                          'Simpan',
                          style: TextStyle(fontSize: 16),
                        ))
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> builMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(
            fontSize: 16, color: mSecondaryTextColor.withOpacity(0.75)),
      ));
}
