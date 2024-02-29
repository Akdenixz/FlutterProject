import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:final_project/firebase_service.dart'; // FirebaseService sınıfının bulunduğu dosyanın yolu

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('Unit Tests', () {
    late FirebaseService firebaseService;

    setUp(() async {
// FirebaseService sınıfını başlat
      await Firebase.initializeApp();
      firebaseService = FirebaseService();
    });

    test('FirebaseService - signInWithEmailAndPassword - Success', () async {
// Emülatörde geçerli bir kullanıcı adı ve şifre kullanmalısınız
      final result = await firebaseService.signInWithEmailAndPassword(
          'ahmetakdd61@gmail.com', '61616161');
      expect(result, isNotNull);
    });

    test('FirebaseService - signInWithEmailAndPassword - Failure', () async {
// Hatalı giriş durumu için geçersiz kullanıcı adı ve şifre kullanabilirsiniz
      final result = await firebaseService.signInWithEmailAndPassword(
          'aho7100@gmail.com', '651641651');
      expect(result, isNull);
    });

    test('FirebaseService - registerUser - Success', () async {
// Yeni bir kullanıcı oluşturun
      final result = await firebaseService.registerUser(
          email: 'aho6161@gmail.com', password: '123456789');
      expect(result, isNotNull);
    });

    test('FirebaseService - registerUser - Failure', () async {
// Geçersiz kullanıcı adı ve şifre kullanabilirsiniz
      final result = await firebaseService.registerUser(
          email: 'aho7120@gmail.com', password: '15648942');
      expect(result, isNull);
    });

    test('FirebaseService - signOut - Success', () async {
// Oturumu kapatma işlemini test et
      await firebaseService.signOut();
      expect(FirebaseAuth.instance.currentUser, isNull);
    });

// Diğer FirebaseService fonksiyonlarını test etmek için benzer testleri ekleyebilirsiniz
  });
}