import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sehatq/screen/pilih_jadwal_dokter.dart';

import '../constant.dart';

class ListMata extends StatefulWidget {
  ListMata({Key? key}) : super(key: key);

  @override
  State<ListMata> createState() => _ListMata();
}

class _ListMata extends State<ListMata> {
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    final _dataDokter = FirebaseDatabase.instance.reference();
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
          'Pilih Dokter',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  StreamBuilder(
                    stream:
                        _dataDokter.child('doktermata').orderByKey().onValue,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      final tilesList = <ListTile>[];
                      if (snapshot.hasData) {
                        final dokterList = Map<String, dynamic>.from(
                            (snapshot.data! as Event).snapshot.value);
                        dokterList.forEach((key, value) {
                          final infoDokterMata =
                              Map<String, dynamic>.from(value);
                          final dokterTile = ListTile(
                            title: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PilihJadwalDok(
                                        foto: infoDokterMata['foto'],
                                        nama: infoDokterMata['nama'],
                                        spesialis:
                                            infoDokterMata['spesialis'])));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: Colors.grey)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: CachedNetworkImage(
                                        imageUrl: infoDokterMata['foto'],
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
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
                                                  text: infoDokterMata['nama'],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: mSecondaryTextColor,
                                                  ),
                                                ),
                                                TextSpan(text: '\n\n'),
                                                TextSpan(
                                                  text: infoDokterMata[
                                                      'spesialis'],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: mPrimaryColor,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      '\nLihat Jadwal Praktik',
                                                  style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    height: 2,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: mSecondaryTextColor
                                                        .withOpacity(0.75),
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
                          tilesList.add(dokterTile);
                        });
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
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
        ],
      ),
    );
  }
}
