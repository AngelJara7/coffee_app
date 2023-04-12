import 'package:coffee_app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FlavorsOptions extends StatelessWidget {

  const FlavorsOptions({super.key, required this.text, required this.flavors,});

  final String text;
  final List<String> flavors;

  @override
  Widget build(BuildContext context) {

    // final selectedFlavor = Provider.of<SelectFalvor>(context);
    // selectedFlavor.setFlavors(flavors);
    print('HOLA MUNDO');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: GoogleFonts.lora(fontSize: 16, fontWeight: FontWeight.w600),),
        const SizedBox(height: 5,),

        // Wrap(
        //   runSpacing: 7,
        //   children: 
        //     [ListView.builder(
        //       scrollDirection: Axis.vertical,
        //       itemCount: flavors.length,
        //       itemBuilder: (context, index) => _FlavosOptions(text: text, flavors: flavors),
        //     ),
        //   ],
        // ),

        Wrap(
          runSpacing: 7,
          children: [
            for(var flavor in flavors) _FlavosOptions(text: flavor, flavors: flavors),
          ],
        ),
      ],
    );
  }
}

class _FlavosOptions extends StatelessWidget {

  const _FlavosOptions({required this.text, required this.flavors,});

  final String text;
  final List<String> flavors;

  @override
  Widget build(BuildContext context) {

    final selectedFlavor = Provider.of<SelectFalvor>(context);
    Color textColor = selectedFlavor.textColor;
    Color background = selectedFlavor.background;
    bool selected = selectedFlavor.selected;
    String tex = selectedFlavor.flavor;
    print('$tex');
    //print('TEXT: $textColor, BACKGROUND: $background');

    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: textColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: const Color.fromRGBO(45, 45, 45, 1))
        ),
        child: Text(text, style: GoogleFonts.poppins(fontSize: 15, color: background), ),
      ),
      onTap: () {
        selectedFlavor.setFlavor(text);
        selectedFlavor.setFlavors(flavors);
        //selectedFlavor.setSelected(true);
        //selectedFlavor.selectedFlavor();
        // print('TEXTO: $textColor, FONDO: $background');
        print('TEXTO: $text');
        // selectedFlavor.setFlavor('');
        // selectedFlavor.setFlavors([]);
      },
    );
  }
}