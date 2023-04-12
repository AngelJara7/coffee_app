import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:coffee_app/widgets/widgets.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key,});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(45, 45, 45, 1),
      width: MediaQuery.of(context).size.width * 0.55,
      child: ListView(
        children: [
          const _DrawerHeader(),

          const SizedBox(height: 30,),
          ListTile(
            title: const _OptionsSideMenu('My Order'),
            onTap: (){},
          ),
          const SizedBox(height: 30,),
          ListTile(
            title: const _OptionsSideMenu('Coffee Selection'),
            onTap: (){}
          ),
          const SizedBox(height: 30,),
          ListTile(
            title: const _OptionsSideMenu('Wallet'),
            onTap: (){},
          ),
          const SizedBox(height: 30,),
          ListTile(
            title: const _OptionsSideMenu('Our Location'),
            onTap: (){},
          ),
          const SizedBox(height: 30,),
        ],
      ),
    );
  }
}

class _OptionsSideMenu extends StatelessWidget {
  const _OptionsSideMenu(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),);
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader();

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const HeaderPage(titlePage: 'NEURO', textLogo: '', icon: Icons.coffee_sharp, textpage: 'COFFEE HOUSE ', color: Colors.white, fontSizeTitle: 18, fontSize: 10,),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            height: MediaQuery.of(context).size.width * 0.18,
            width: MediaQuery.of(context).size.width * 0.18,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              //border: Border.all(width: 5, color: Colors.white)
            ),
            child: const Icon(
              Icons.person,
              size: 60,
              color: Color.fromRGBO(45, 45, 45, 1),
            ),
          ),
          Text('usuario@email.com', style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),)
        ],
      )
    );
  }
}