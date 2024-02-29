import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'main.dart';  // Dosya adına ve FirebaseService sınıfının bulunduğu yerlere göre düzenleyin
import 'package:firebase_core/firebase_core.dart';

void main() {
  group('Widget Tests', () {
    // MyApp widget'ını test et
    testWidgets('MyApp Widget Test', (WidgetTester tester) async {
      await Firebase.initializeApp();
      await tester.pumpWidget(MyApp());

      expect(find.text('Tedarik Paylaşımı'), findsOneWidget);
      // MyApp widget'ını test edeflbileceğiniz diğer öğeleri buraya ekleyebilirsiniz
    });

    // MyWidget widget'ını test et
    testWidgets('MyWidget Widget Test', (WidgetTester tester) async {
      await Firebase.initializeApp();
      await tester.pumpWidget(MyApp());

      expect(find.text('Hello'), findsOneWidget);
      // MyWidget widget'ını test edebileceğiniz diğer öğeleri buraya ekleyebilirsiniz
    });

    // MyHomePage widget'ını test et
    testWidgets('MyHomePage Widget Test', (WidgetTester tester) async {
      await Firebase.initializeApp();
      await tester.pumpWidget(GetMaterialApp(home: MyHomePage()));

      // MyHomePage widget'ını test edebileceğiniz diğer öğeleri buraya ekleyebilirsiniz
      expect(find.text('Tedarik Paylaşımı'), findsOneWidget);
      expect(find.byType(TextField), findsWidgets);
      expect(find.byType(ElevatedButton), findsWidgets);
      expect(find.text('Başkalarının Tedarikleri'), findsOneWidget);
    });

    // LoginPage widget'ını test et
    testWidgets('LoginPage Widget Test', (WidgetTester tester) async {
      await Firebase.initializeApp();
      await tester.pumpWidget(GetMaterialApp(home: LoginPage()));

      // LoginPage widget'ını test edebileceğiniz diğer öğeleri buraya ekleyebilirsiniz
      expect(find.text('Giriş'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.byType(ElevatedButton), findsNWidgets(2));
    });

    // TedarikDetailPage widget'ını test et
    testWidgets('TedarikDetailPage Widget Test', (WidgetTester tester) async {
      // TedarikDetailPage'e geçiş yapmadan önce bir tedarik örneği oluşturun
      Tedarik sampleTedarik = Tedarik(
        urunAdi: 'Örnek Ürün',
        fiyat: 99.99,
        modelYili: '2022',
        garantiSuresi: '2 Yıl',
      );

      await tester.pumpWidget(GetMaterialApp(home: TedarikDetailPage(tedarik: sampleTedarik)));

      // TedarikDetailPage widget'ını test edebileceğiniz diğer öğeleri buraya ekleyebilirsiniz
      expect(find.text('Örnek Ürün'), findsOneWidget);
      expect(find.byType(Text), findsWidgets);
    });
  });
}