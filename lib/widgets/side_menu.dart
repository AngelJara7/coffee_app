import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key,});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(45, 45, 45, 1),
      width: MediaQuery.of(context).size.width * 0.55,
      child: ListView(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const HeaderPage(titlePage: 'NEURO', textLogo: '', icon: Icons.coffee_sharp, textpage: 'COFFEE HOUSE ', color: Colors.white, fontSizeTitle: 16, fontSize: 9,),
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
          ),
          const SizedBox(height: 30,),
          ListTile(
            title: Text('My Order', style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),),
            onTap: (){},
          ),
          const SizedBox(height: 30,),
          ListTile(
            title: Text('Coffee Selection', style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),),
            onTap: (){},
          ),
          const SizedBox(height: 30,),
          ListTile(
            title: Text('Wallet', style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),),
            onTap: (){},
          ),
          const SizedBox(height: 30,),
          ListTile(
            title: Text('Our Location', style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),),
            onTap: (){},
          ),
          const SizedBox(height: 30,),
        ],
      ),
    );
  }
}