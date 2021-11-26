import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sehatq/constant.dart';
import 'package:sehatq/screen/home_screen.dart';
import 'package:sehatq/screen/keranjang.dart';
import 'package:sehatq/screen/obat_detail.dart';

class BeliObat extends StatefulWidget {
  const BeliObat({Key? key}) : super(key: key);

  @override
  State<BeliObat> createState() => _BeliObatState();
}

class _BeliObatState extends State<BeliObat> {
  @override
  Widget build(BuildContext context) {
    final _dataObat = FirebaseDatabase.instance.reference();
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: mPrimaryColor,
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            icon: Icon(
              Icons.arrow_back,
              size: 40,
            ),
          ),
          title: Text(
            'Beli Obat',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Keranjang()));
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: 40,
                ),
              ),
            ),
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
                        hintText: "Ketik disini untuk mencari....",
                        hintStyle: TextStyle(
                            fontSize: 18,
                            color: mSecondaryTextColor.withOpacity(0.90)),
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
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Text(
                              'Kategori',
                              style: TextStyle(
                                color: mSecondaryTextColor.withOpacity(0.75),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          Container(
                            margin:
                                EdgeInsets.symmetric(vertical: kDefaultPadding),
                            child: Text(
                              "Semua Produk",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: mSecondaryTextColor.withOpacity(0.75),
                              ),
                            ),
                          ),
                          StreamBuilder(
                            stream:
                                _dataObat.child('obat').orderByKey().onValue,
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              final tilesList = <ListTile>[];
                              if (snapshot.hasData) {
                                CircularProgressIndicator();
                                final obatList = Map<String, dynamic>.from(
                                    (snapshot.data! as Event).snapshot.value);
                                obatList.forEach((key, value) {
                                  final infoObat =
                                      Map<String, dynamic>.from(value);
                                  final obatTile = ListTile(
                                    title: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ObatDetail(
                                                        fotoObat:
                                                            infoObat['foto'],
                                                        hargaObat:
                                                            infoObat['harga'],
                                                        namaObat:
                                                            infoObat['nama'])));
                                      },
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: CachedNetworkImage(
                                                imageUrl: infoObat['foto'],
                                                height: 100,
                                                width: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Container(
                                              width: 200,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              infoObat['nama'],
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                mSecondaryTextColor,
                                                          ),
                                                        ),
                                                        TextSpan(text: '\n\n'),
                                                        TextSpan(
                                                          text:
                                                              infoObat['harga'],
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                mPrimaryColor,
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
                                  tilesList.add(obatTile);
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
                    Positioned(
                      top: 40,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CategoryToko(
                              imgSrc: "assets/images/kategori_toko_menu.png",
                              label: "Semua Kategori",
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            CategoryToko(
                              imgSrc: "assets/images/kategori_toko_vitamin.png",
                              label: "Vitamin",
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            CategoryToko(
                              imgSrc: "assets/images/kategori_toko_obat.png",
                              label: "Obat",
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            CategoryToko(
                              imgSrc:
                                  "assets/images/kategori_toko_alat_kesehatan.png",
                              label: "Alat Kesehatan",
                            ),
                            SizedBox(
                              width: 1,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class CategoryToko extends StatelessWidget {
  final String imgSrc, label;
  const CategoryToko({
    Key? key,
    required this.imgSrc,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 77,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Column(
            children: <Widget>[
              Spacer(),
              Image.asset(
                imgSrc,
                height: 50,
                width: 50,
              ),
              Spacer(),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: mSecondaryTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
