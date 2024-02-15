import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';
import 'package:o3d/o3d.dart';

class HomeMainPage extends StatefulWidget {
  const HomeMainPage({Key? key}) : super(key: key);

  @override
  State<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
  GunesSistemiVerileri veriler = GunesSistemiVerileri();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Kozmik Keşif Atölyesi')),
        backgroundColor: Colors.transparent,
        elevation: 100,
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: veriler.solList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(veriler.solList[index]),
                      subtitle: Text(veriler.altYazilarSol[index]),
                      contentPadding: const EdgeInsets.all(15.0),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset(
                          veriler.solimageUrls[index],
                          fit: BoxFit.cover,
                          height: 100,
                          width: 90,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondPage(
                              selectedList: veriler.twoSolList,
                              selectedAltYazilar: veriler.twoAltYazilarSol,
                              selectedImageUrls: veriler.twoSolimageUrls,
                              selectedIndex: index,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded( 
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: veriler.sagList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(veriler.sagList[index]),
                      contentPadding: const EdgeInsets.all(15.0),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset(
                          veriler.sagimageUrls[index],
                          fit: BoxFit.cover,
                          height: 100,
                          width: 90,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondPage(
                              selectedList: veriler.twoSagList,
                              selectedAltYazilar: veriler.twoAltYazilarSag,
                              selectedImageUrls: veriler.twoSagimageUrls,
                              selectedIndex: index,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final List<String> selectedList;
  final List<String> selectedAltYazilar;
  final List<String> selectedImageUrls;
  final int selectedIndex;

  const SecondPage({
    Key? key,
    required this.selectedList,
    required this.selectedAltYazilar,
    required this.selectedImageUrls,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              background: SizedBox(
                height: 400,
                child: selectedImageUrls[selectedIndex].endsWith(
                        '.glb') 
                    ? O3D(
                        src: selectedImageUrls[selectedIndex],
                        controller: O3DController(),
                        ar: false,
                        autoPlay: true,
                        autoRotate: true,
                      )
                    : Image.asset(
                        selectedImageUrls[selectedIndex],
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  width: 20,
                  height: 10,
                ),
                FutureBuilder(
                  future:
                      Future.delayed(const Duration(seconds: 3), () => true),
                  builder: (context, snapshot) {
                    if (selectedImageUrls[selectedIndex].endsWith('.glb')) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const LinearProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Hata: ${snapshot.error}');
                      } else {
                        return Container(
                          height: 10,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        );
                      }
                    } else {
                      return Container(
                          height: 10,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        );
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Title(
                          color: Colors.blue,
                          child: Text(
                            selectedList[selectedIndex],
                            style: const TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          selectedAltYazilar[selectedIndex],
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
