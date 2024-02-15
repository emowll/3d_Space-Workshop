import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ana_sayfam.dart/kontrol_sayfam.dart';
import 'package:intro_slider/intro_slider.dart';

class KarsilamaEKranim extends StatefulWidget {
  const KarsilamaEKranim({super.key});

  @override
  State<KarsilamaEKranim> createState() => _KarsilamaEKranimState();
}

class _KarsilamaEKranimState extends State<KarsilamaEKranim> {
  List<ContentConfig> listContentConfig = [];

  @override
  void initState() {
    super.initState();

    listContentConfig.add(
      const ContentConfig(
        title: "Galaksi Portali: Sonsuzluğa Hoş Geldin!",
        description:
            "Galaksi Portali: Sonsuzluğa Hoş Geldin! Uzayın derinliklerindeki bilinmeyenlerin peşinden gitmeye hazır mısın? Galaksi Portali, sana sonsuz bir keşif deneyimi sunmak için burada! Uygulamamızla birlikte, farklı galaksileri keşfet ve evrende sana bekleyen sürprizleri keşfetme şansını yakala.",
        backgroundColor: Color(0xff203152),
        backgroundImage: "assets/karsılama_sayfam/giris_ekran_1_dv.jpg",
      ),
    );

    listContentConfig.add(
      const ContentConfig(
        title: "Yıldızlı Yolculuklara Hazır mısın? ",
        description:
            "Yıldızlı Yolculuklara Hazır mısın? Galaksi Kapıları Açılıyor! Yıldızlı bir maceraya hazır ol! Galaksi Kapıları'nın ardında seni bekleyen benzersiz dünyaları keşfetmeye hazır ol. Uygulamamız, seni uzak galaksilerin sırlarını çözüyor ve olağanüstü gökadalar arasında muhteşem bir yere davet ediyor.",
        backgroundColor: Color(0xff203152),
        backgroundImage: "assets/karsılama_sayfam/giris_ekran_2_dv.jpg",
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "Uzayın Derinliklerini Keşfet!",
        description:
            "Galaksi Sırları: Uzayın Derinliklerindeki Gizemleri Keşfet!Uzayın gizemiyle dolu hoş geldin! Galaksi Sırları, sizi bilinmeyenin ortaya çıkaracak ve uzayın derinliklerindeki gizemleri ortaya çıkarmayı sağlayacak. Keşfetmeye ve sonuçlarına açık ol, çünkü burada seni şaşırtan birçok sürpriz var!",
        backgroundColor: Color(0xff9932CC),
        backgroundImage: "assets/karsılama_sayfam/giris_ekran_3_dv.jpg",
      ),
    );
  }

 void onDonePress() {
  log("End of slides");
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => AkisSayfam(),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      key: UniqueKey(),
      listContentConfig: listContentConfig,
      onDonePress: onDonePress,
    );
  }
}
