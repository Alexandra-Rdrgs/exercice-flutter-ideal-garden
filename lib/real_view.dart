import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RealView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          personalizedPadding(),
          Text(
            "Nos réalisations",
            style: TextStyle(
              color: Colors.lightGreen.shade300,
              fontSize: 20,
            ),
          ),
          personalizedPadding(),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(
                    "Picines",
                    style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                        color: Colors.lightGreen.shade300,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          swimmingPool(size: size),
          personalizedPadding(),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Jardins",
                    style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                        color: Colors.lightGreen.shade300,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          garden(),
        ],
      ),
    );
  }

  Padding personalizedPadding() =>
      const Padding(padding: EdgeInsets.only(top: 20));

  Widget swimmingPool({required Size size}) {
    return Container(
      height: size.height * 0.48,
      width: size.width,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
                height: size.height * 0.3,
                child: Image.asset(
                  'images/piscine_${index + 1}.jpeg',
                  color: Colors.white.withOpacity(0.85),
                  colorBlendMode: BlendMode.modulate,
                  fit: BoxFit.fill,
                ));
          },
          separatorBuilder: ((context, index) => Divider()),
          itemCount: 5),
    );
  }

  Widget garden() {
    return Container(
      height: 135,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(5),
              height: 125,
              width: 125,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset('images/jardin_${index + 1}.jpeg',
                    color: Colors.white.withOpacity(0.85),
                    colorBlendMode: BlendMode.modulate,
                    fit: BoxFit.cover),
              ),
            );
          }),
    );
  }
}
