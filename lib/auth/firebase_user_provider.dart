import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import 'auth_util.dart';

class SwaimPlayGroundFirebaseUser {
  SwaimPlayGroundFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

SwaimPlayGroundFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SwaimPlayGroundFirebaseUser> swaimPlayGroundFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<SwaimPlayGroundFirebaseUser>(
      (user) {
        currentUser = SwaimPlayGroundFirebaseUser(user);
        updateUserJwtTimer(user);
        return currentUser!;
      },
    );
