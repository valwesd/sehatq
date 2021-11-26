import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sehatq/screen/list_dokter_mata.dart';

import '../constant.dart';

class RumahSakitDetail extends StatefulWidget {
  final String rsFoto;
  final String rsAlamat;
  final String rsNama;
  const RumahSakitDetail(
      {Key? key,
      required this.rsAlamat,
      required this.rsFoto,
      required this.rsNama})
      : super(key: key);

  @override
  State<RumahSakitDetail> createState() => _RumahSakitDetailState();
}

class _RumahSakitDetailState extends State<RumahSakitDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mPrimaryColor,
        title: Text(
          widget.rsNama,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 40,
          ),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/buatJanji');
          },
        ),
        actions: [],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: [
                Container(
                  //margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 8),
                      blurRadius: 5,
                      color: mPrimaryColor.withOpacity(0.25),
                    ),
                  ]),
                  child: Column(
                    children: [
                      Container(
                        height: 130,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CachedNetworkImage(
                                imageUrl: widget.rsFoto,
                                height: 110,
                                width: 150,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Container(
                              width: 200,
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.rsNama,
                                    style: TextStyle(
                                      color:
                                          mSecondaryTextColor.withOpacity(0.75),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                      '\nRumah Sakit\nGondokusuman, Yogyakarta')
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5, bottom: 10),
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                  color: mSecondaryTextColor.withOpacity(0.75),
                                ),
                                children: [
                              TextSpan(
                                  text: 'Jam Operasional\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(text: 'Senin - Minggu 00:00 - 23:59\n'),
                              TextSpan(text: 'Gawat Darurat 24 Jam\n\n'),
                              TextSpan(
                                  text: 'Alamat\n\n',
                                  style: TextStyle(
                                    //height: 1,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(text: widget.rsAlamat),
                            ])),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(width: 1, color: Colors.grey))),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: ListTile(
                        title: Text(
                          'Umum',
                          style: TextStyle(
                              color: mSecondaryTextColor.withOpacity(0.75),
                              fontSize: 18),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(width: 1, color: Colors.grey))),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: ListTile(
                        title: Text(
                          'Jantung',
                          style: TextStyle(
                              color: mSecondaryTextColor.withOpacity(0.75),
                              fontSize: 18),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(width: 1, color: Colors.grey))),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListMata()));
                      },
                      child: ListTile(
                        title: Text(
                          'Mata',
                          style: TextStyle(
                              color: mSecondaryTextColor.withOpacity(0.75),
                              fontSize: 18),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(width: 1, color: Colors.grey))),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: ListTile(
                        title: Text(
                          'Lainnya',
                          style: TextStyle(
                              color: mSecondaryTextColor.withOpacity(0.75),
                              fontSize: 18),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
