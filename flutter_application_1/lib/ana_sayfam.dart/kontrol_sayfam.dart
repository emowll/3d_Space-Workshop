import 'package:flutter/material.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter_application_1/3_d_model_page.dart';
import 'package:flutter_application_1/ana_sayfam.dart/home_main_page.dart';
import 'package:flutter_application_1/giri%C5%9F_ekran%C4%B1.dart/kar%C5%9F%C4%B1lama_sayfam.dart';

enum _SeciliSayfa { home,  add,  profile }

class AkisSayfam extends StatefulWidget {
  const AkisSayfam({Key? key}) : super(key: key);

  @override
  State<AkisSayfam> createState() => _AkisSayfamState();
}

class _AkisSayfamState extends State<AkisSayfam> {
  _SeciliSayfa _seciliSayfa = _SeciliSayfa.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          _buildSayfaIcerigi(),
        ],
      ),
      bottomNavigationBar: CrystalNavigationBar(
        currentIndex: _SeciliSayfa.values.indexOf(_seciliSayfa),
        unselectedItemColor: Colors.white70,
        backgroundColor: Colors.black.withOpacity(0.1),
        onTap: _taniticiDiziniDegistirildi,
        items: [
          CrystalNavigationBarItem(
            icon: Icons.home,
            selectedColor: Colors.blue,
          ),
          CrystalNavigationBarItem(
            icon: Icons.add,
            selectedColor: Colors.green,unselectedColor: Colors.red
          ),
          CrystalNavigationBarItem(
            icon: Icons.person,
            selectedColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildSayfaIcerigi() {
    switch (_seciliSayfa) {
      case _SeciliSayfa.home:
        return const HomeMainPage();

      case _SeciliSayfa.add:
        return const KarsilamaEKranim();
      case _SeciliSayfa.profile:
        return const KarsilamaEKranim();
      default:
        return Container();
    }
  }

  void _taniticiDiziniDegistirildi(int index) {
    setState(() {
      _seciliSayfa = _SeciliSayfa.values[index];
    });
  }
}
