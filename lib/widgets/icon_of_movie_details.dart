import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Iconofmoviedetals extends StatelessWidget {
  Iconofmoviedetals({super.key, this.contentText, this.rated});

  String? contentText;

  bool? rated;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: HexColor("#312F35"),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 8,
                  top: 8,
                  left: 15,
                  right: 15,
                ),
                child: Row(
                  children: [
                    rated! ? Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: HexColor("#FFFF00"),
                        ),
                        SizedBox(width: 3,),
                      ],
                    ) : SizedBox(),
                    Expanded(
                      child: Center(
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          contentText!,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: HexColor("#FFFFFF")
                          ),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
