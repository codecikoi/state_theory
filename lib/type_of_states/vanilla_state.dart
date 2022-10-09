import 'package:flutter/material.dart';

class VanillaState extends StatefulWidget {
  const VanillaState({Key? key}) : super(key: key);

  @override
  State<VanillaState> createState() => _VanillaStateState();
}

class _VanillaStateState extends State<VanillaState> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    double size = 50;

    return Scaffold(
      appBar: AppBar(
        title: Text('Vanilla State'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _rating = 1;
                });
              },
              icon: (_rating >= 1
                  ? Icon(
                      Icons.star,
                      size: size,
                    )
                  : Icon(
                      Icons.star_border,
                      size: size,
                    )),
              color: Colors.indigo[500],
              iconSize: size,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _rating = 2;
                });
              },
              icon: (_rating >= 2
                  ? Icon(
                      Icons.star,
                      size: size,
                    )
                  : Icon(
                      Icons.star_border,
                      size: size,
                    )),
              color: Colors.indigo[500],
              iconSize: size,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _rating = 3;
                });
              },
              icon: (_rating >= 3
                  ? Icon(
                      Icons.star,
                      size: size,
                    )
                  : Icon(
                      Icons.star_border,
                      size: size,
                    )),
              color: Colors.indigo[500],
              iconSize: size,
            ),
          ],
        ),
      ),
    );
  }
}
