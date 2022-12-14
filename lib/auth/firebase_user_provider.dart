import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SwaimFirebaseUser {
  SwaimFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

SwaimFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SwaimFirebaseUser> swaimFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<SwaimFirebaseUser>(
      (user) {
        currentUser = SwaimFirebaseUser(user);
        return currentUser!;
      },
    );
