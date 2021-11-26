import 'package:flutter/material.dart';
import 'package:sehatq/constant.dart';
import 'package:sehatq/widget/data_diproses_page.dart';

class TanyaGratis extends StatefulWidget {
  const TanyaGratis({Key? key}) : super(key: key);

  @override
  State<TanyaGratis> createState() => _TanyaGratisState();
}

class _TanyaGratisState extends State<TanyaGratis> {
  final items = ['Laki - Laki', 'Perempuan'];
  String? isi;
  bool value = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mPrimaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 40,
          ),
        ),
        title: Text(
          'Daftar Konsultasi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: kDefaultPadding),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          letterSpacing: 0.1,
                          fontSize: 12,
                        ),
                        children: [
                          TextSpan(
                            text: "Silahkan baca",
                            style: TextStyle(
                              color: mSecondaryTextColor,
                            ),
                          ),
                          TextSpan(
                            text: " Disclaimer",
                            style: TextStyle(
                              color: mPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                " kami sebelum memulai konsultasi\nWaktu konsultasinya ",
                            style: TextStyle(
                              color: mSecondaryTextColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                            text: "30 menit",
                            style: TextStyle(
                              color: mPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ", ya",
                            style: TextStyle(
                              color: mSecondaryTextColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                            text: "\n\nKamu konsultasi untuk siapa?",
                            style: TextStyle(
                              fontSize: 14,
                              color: mSecondaryTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: kDefaultPadding),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: mPrimaryColor,
                      ),
                    ),
                    child: FittedBox(
                      child: Icon(
                        Icons.account_circle_outlined,
                        color: Colors.grey,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: 10, left: kDefaultPadding * 1.5),
                    child: Text(
                      "Saya",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: mPrimaryColor,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Keluhan Saya...",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5, bottom: 20),
                        padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding, vertical: 5),
                        height: 54,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 0.45,
                            color: Colors.grey,
                          ),
                        ),
                        child: Center(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Gejala dan durasi yang dialami",
                              hintStyle:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Tanggal Lahir",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5, bottom: 20),
                        padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding, vertical: 5),
                        height: 54,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 0.45,
                            color: Colors.grey,
                          ),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Isikan tanggal lahir disini",
                            hintStyle:
                                TextStyle(fontSize: 18, color: Colors.grey),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                      Text(
                        " Jenis Kelamin",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        width: size.width,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 0.45,
                            color: Colors.grey,
                          ),
                        ),
                        child: DropdownButton<String>(
                            value: isi,
                            isExpanded: true,
                            hint: Text(
                              'Laki - Laki/Perempuan',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                            items: items.map(builMenuItem).toList(),
                            onChanged: (value) => setState(() {
                                  this.isi = value;
                                })),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: value,
                            onChanged: (value) =>
                                setState(() => this.value = value!),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Saya telah membaca dan menyetujui',
                                style: TextStyle(
                                    color:
                                        mSecondaryTextColor.withOpacity(0.75),
                                    fontSize: 16),
                              ),
                              Text(
                                'Syarat & Ketentuan SehatQ',
                                style: TextStyle(
                                    color: mPrimaryColor, fontSize: 16),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: 'Waktu Konsultasi ',
                            style: TextStyle(
                                color: mSecondaryTextColor.withOpacity(0.75),
                                fontSize: 16),
                          ),
                          TextSpan(
                            text: '30 Menit',
                            style:
                                TextStyle(color: mPrimaryColor, fontSize: 16),
                          ),
                          TextSpan(
                            text: ', ya',
                            style: TextStyle(
                                color: mSecondaryTextColor.withOpacity(0.75),
                                fontSize: 16),
                          ),
                        ])),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                          onPressed: () => showConfirmDialog(context),
                          style: ElevatedButton.styleFrom(
                            primary: mPrimaryColor,
                            minimumSize: Size(size.width, 45),
                          ),
                          child: Text(
                            'Lanjutkan',
                            style: TextStyle(fontSize: 16),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showConfirmDialog(BuildContext context) => showDialog(
        builder: (context) => Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 12,
                ),
                Text('Apakah data yang anda masukan sudah benar?'),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: mPrimaryColor,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DataTunggu()));
                      },
                      child: Text(
                        'Ya',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Tidak',
                          style: TextStyle(
                            fontSize: 16,
                            color: mSecondaryTextColor.withOpacity(0.75),
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
        context: context,
        barrierDismissible: false,
      );
  DropdownMenuItem<String> builMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(
            fontSize: 16, color: mSecondaryTextColor.withOpacity(0.75)),
      ));
}
