import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sehatq/widget/data_diproses_page.dart';

import '../constant.dart';

class PilihJadwalDok extends StatefulWidget {
  final String foto;
  final String nama;
  final String spesialis;
  PilihJadwalDok({
    Key? key,
    required this.foto,
    required this.nama,
    required this.spesialis,
  }) : super(key: key);

  @override
  State<PilihJadwalDok> createState() => _PilihJadwalDok();
}

class _PilihJadwalDok extends State<PilihJadwalDok> {
  Color _colorContainer = Colors.white;
  late Color pressedColor;
  @override
  void initState() {
    pressedColor = mPrimaryColor;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int indexCol = -1;
    Color enableColor = mPrimaryColor;
    Color disableColor = Colors.white;
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
          'Pilih Jadwal Praktik'.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 150,
              padding: EdgeInsets.symmetric(
                  vertical: 20, horizontal: kDefaultPadding),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: CachedNetworkImage(
                        imageUrl: widget.foto,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 125,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: widget.nama,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: mSecondaryTextColor,
                                  ),
                                ),
                                TextSpan(text: '\n\n'),
                                TextSpan(
                                  text: widget.spesialis,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: mPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: MediaQuery.of(context).size.width,
              height: 300,
              padding: EdgeInsets.symmetric(
                  vertical: 5, horizontal: kDefaultPadding),
              decoration: BoxDecoration(
                  color: mBackgroundColor,
                  border: Border.all(color: mPrimaryColor),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: kDefaultPadding),
                      child: Text(
                        'Pilih Jadwal Praktik',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: mSecondaryTextColor.withOpacity(0.75),
                            fontSize: 18),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: kDefaultPadding),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: mPrimaryColor)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kamis, 25 November 2021',
                                  style: TextStyle(
                                      color:
                                          mSecondaryTextColor.withOpacity(0.95),
                                      fontSize: 16),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Material(
                                      child: InkWell(
                                        customBorder:
                                            Border.all(color: mPrimaryColor),
                                        borderRadius: BorderRadius.circular(3),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: _colorContainer,
                                              border: Border.all(
                                                  color: mPrimaryColor)),
                                          child: Center(
                                            child: Text(
                                              '09:00 - 11:00',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: mSecondaryTextColor
                                                    .withOpacity(0.70),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          width: 110,
                                          height: 35,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            _colorContainer =
                                                _colorContainer == mPrimaryColor
                                                    ? Colors.white
                                                    : mPrimaryColor;
                                          });
                                        },
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          indexCol = 1;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        side: BorderSide(color: mPrimaryColor),
                                        minimumSize: Size(35, 30),
                                        elevation: 0,
                                        backgroundColor: indexCol == 1
                                            ? enableColor
                                            : disableColor,
                                      ),
                                      child: Text(
                                        '12:00 - 13:00',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: mSecondaryTextColor
                                              .withOpacity(0.75),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: kDefaultPadding),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: mPrimaryColor)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Selasa, 30 November 2021',
                                  style: TextStyle(
                                      color:
                                          mSecondaryTextColor.withOpacity(0.95),
                                      fontSize: 16),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          indexCol = 2;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        side: BorderSide(color: mPrimaryColor),
                                        minimumSize: Size(35, 30),
                                        elevation: 0,
                                        backgroundColor: indexCol == 2
                                            ? enableColor
                                            : disableColor,
                                      ),
                                      child: Text(
                                        '09:00 - 12:00',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: mSecondaryTextColor
                                              .withOpacity(0.75),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          indexCol = 3;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        side: BorderSide(color: mPrimaryColor),
                                        minimumSize: Size(35, 30),
                                        elevation: 0,
                                        backgroundColor: indexCol == 3
                                            ? enableColor
                                            : disableColor,
                                      ),
                                      child: Text(
                                        '12:00 - 13:00',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: mSecondaryTextColor
                                              .withOpacity(0.75),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: kDefaultPadding),
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: mPrimaryColor)),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 40,
                                color: Colors.white,
                                child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      onSurface: Colors.white,
                                      side: BorderSide(color: mPrimaryColor),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'Pilih Jadwal lain',
                                      style: TextStyle(
                                          color: mSecondaryTextColor
                                              .withOpacity(0.95),
                                          fontSize: 16),
                                    )),
                              )),
                        ],
                      ),
                    ),
                  ]),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              height: 180,
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: mPrimaryColor,
                        onPrimary: Colors.white,
                        minimumSize: Size(380, 40)),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => DataTunggu(),
                        ),
                      );
                    },
                    child: Text(
                      'Buat Janji',
                      style:
                          TextStyle(fontStyle: FontStyle.normal, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
  final getColor = (Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return colorPressed;
    } else {
      return color;
    }
  };

  return MaterialStateProperty.resolveWith(getColor);
}
