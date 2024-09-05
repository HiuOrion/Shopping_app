import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGoogle {
  final _auth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithGoogle() async {

    //Tương tác đăng nhập bằng google
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //Lấy chi tiết xác thực từ request
    final GoogleSignInAuthentication  gAuth = await gUser!.authentication;

    //Tạo thông tin xác thực cho người dùng
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken
    );

    return await _auth.signInWithCredential(credential);
  }
}