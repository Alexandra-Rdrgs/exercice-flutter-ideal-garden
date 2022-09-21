import 'package:exercice_drawer/home_view.dart';
import 'package:exercice_drawer/real_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'menu_item.dart';

class AppController extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<AppController> {
  int index = 0;
  List<ItemMenu> items = [
    ItemMenu(name: "Acceuil", body: HomeView()),
    ItemMenu(name: "Realisations", body: RealView())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ideal Garden",
          style: GoogleFonts.getFont('Raleway'),
        ),
        backgroundColor: Colors.lightGreen.shade300,
        shadowColor: Colors.green.shade100,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white70,
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.lightGreen.shade300,
        child: ListView.builder(
          itemCount: items.length + 1,
          itemBuilder: (context, index) {
            return (index == 0) ? drawerHeader() : tileFromIndex(index);
          },
        ),
      ),
      body: items[index].body,
    );
  }

  ListTile tileFromIndex(int index) {
    final int newIndex = index - 1;
    final ItemMenu item = items[newIndex];
    final String name = item.name;
    return ListTile(
      title: Text(
        name,
        textAlign: TextAlign.center,
        style: GoogleFonts.raleway(
          textStyle: const TextStyle(
            color: Colors.white70,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          this.index = newIndex;
          Navigator.pop(context);
        });
      },
    );
  }

  DrawerHeader drawerHeader() {
    return DrawerHeader(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.spa,
              color: Colors.white70,
              size: 50,
            ),
            Text(
              "Ideal Garden",
              style: GoogleFonts.raleway(
                textStyle: const TextStyle(
                  color: Colors.white70,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
