import 'package:flutter/material.dart';
import 'package:sehatq/constant.dart';

class BeliObat extends StatefulWidget {
  const BeliObat({Key? key}) : super(key: key);

  @override
  State<BeliObat> createState() => _BeliObatState();
}

class _BeliObatState extends State<BeliObat> {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: mPrimaryColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/homePage');
            },
            icon: Icon(Icons.arrow_back),
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
                onPressed: () {},
                icon: Icon(Icons.add_shopping_cart_outlined),
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
            Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: kDefaultPadding),
                      child: Text(
                        'Kategori',
                        style: TextStyle(
                          color: mSecondaryTextColor.withOpacity(0.75),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Row(
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
                          CategoryToko(
                            imgSrc:
                                "assets/images/kategori_toko_makanan_minuman.png",
                            label: "Makanan & Minuman",
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
                      child: Text(
                        "Semua Produk",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: mSecondaryTextColor.withOpacity(0.75),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GridView.count(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                        crossAxisCount: 2,
                        children: <Widget>[
                          Container(
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ),
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
      height: 100,
      width: 84,
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
                  color: mSecondaryTextColor.withOpacity(0.75),
                  fontSize: 12,
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
