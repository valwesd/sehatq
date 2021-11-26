import 'package:flutter/material.dart';
import 'package:sehatq/constant.dart';

class CategoryMenu extends StatelessWidget {
  final String imgSrc, judul;
  final VoidCallback press;
  const CategoryMenu({
    Key? key,
    required this.imgSrc,
    required this.judul,
    required this.press,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(13),
          onTap: press,
          child: Column(
            children: <Widget>[
              Spacer(),
              Image.asset(
                imgSrc,
                height: 92.21,
                width: 90.7,
              ),
              Spacer(),
              Text(
                judul,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: mSecondaryTextColor,
                  fontSize: 20,
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
