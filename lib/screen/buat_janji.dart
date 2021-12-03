import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sehatq/constant.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:sehatq/screen/rumah_sakit_detail.dart';

class BuatJanji extends StatefulWidget {
  const BuatJanji({Key? key}) : super(key: key);

  @override
  State<BuatJanji> createState() => _BuatJanjiState();
}

class _BuatJanjiState extends State<BuatJanji> {
  final _dataRS = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover)),
        ),
        elevation: 0,
        backgroundColor: mPrimaryColor,
        leading: IconButton(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 40,
          ),
        ),
        title: Text(
          'Buat Janji'.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: kDefaultPadding),
            child: ActionChip(
              backgroundColor: mPrimaryColor.withOpacity(0.40),
              label: Text('Riwayat',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: mSecondaryTextColor,
                  )),
              onPressed: () {},
              avatar: Icon(
                Icons.history_outlined,
                size: 30,
                color: mSecondaryTextColor,
              ),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size(kDefaultPadding, 95),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding, vertical: 5),
                  height: 54,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.05,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 8),
                        blurRadius: 5,
                        color: mSecondaryTextColor.withOpacity(0.15),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Ketik disini untuk mencari",
                      hintStyle: TextStyle(
                          fontSize: 18,
                          color: mSecondaryTextColor.withOpacity(0.75)),
                      suffixIcon: Icon(
                        Icons.search,
                        size: 30,
                        color: mSecondaryTextColor,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Pilih Fasilitas Kesehatan",
                        style: TextStyle(
                          color: mSecondaryTextColor.withOpacity(0.75),
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    StreamBuilder(
                      stream: _dataRS.child('rumahsakit').orderByKey().onValue,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        final tilesList = <ListTile>[];
                        if (snapshot.hasData) {
                          final rumahSakitList = Map<String, dynamic>.from(
                              (snapshot.data! as Event).snapshot.value);
                          rumahSakitList.forEach((key, value) {
                            final infoRumahSakit =
                                Map<String, dynamic>.from(value);
                            final rumahSakitTile = ListTile(
                              title: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => RumahSakitDetail(
                                          rsAlamat: infoRumahSakit['alamat'],
                                          rsFoto: infoRumahSakit['foto'],
                                          rsNama: infoRumahSakit['nama'])));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1, color: Colors.grey)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: CachedNetworkImage(
                                          imageUrl: infoRumahSakit['foto'],
                                          height: 80,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        width: 200,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        infoRumahSakit['nama'],
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          mSecondaryTextColor,
                                                    ),
                                                  ),
                                                  TextSpan(text: '\n\n'),
                                                  TextSpan(
                                                    text: infoRumahSakit[
                                                        'alamat'],
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                            tilesList.add(rumahSakitTile);
                          });
                          return Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.25),
                                    width: 1)),
                            child: ListView(
                              padding: EdgeInsets.all(5),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: tilesList,
                            ),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
