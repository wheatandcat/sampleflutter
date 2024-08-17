import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stockkeeper/providers/graphql.dart';
import 'package:stockkeeper/graphql/me.gql.dart';

class UserData {
  late final String id;
  late final String uid;

  UserData({
    required this.id,
    required this.uid,
  });

  void update(UserData newUser) {
    id = newUser.id;
    uid = newUser.uid;
  }
}

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authStateChangesProvider = StreamProvider<User?>((ref) {
  return ref.read(firebaseAuthProvider).authStateChanges();
});

final userDataProvider = FutureProvider.autoDispose<UserData?>((ref) async {
  final user = ref.watch(authStateChangesProvider).asData?.value;
  if (user == null) {
    return null;
  }
  final client = ref.read(graphqlClientProvider);
  final result = await client.query<Query$Me>(
    QueryOptions(
      document: documentNodeQueryMe,
    ),
  );

  if (result.hasException) {
    return null;
  }

  final userData = result.data!['me'];
  return UserData(
    id: userData['id'],
    uid: userData['uid'],
  );
});

class GuestData {
  String id;
  String uid;

  GuestData({
    required this.id,
    required this.uid,
  });

  void update(GuestData newUser) {
    id = newUser.id;
    uid = newUser.uid;
  }
}

final guestStateProvider =
    StateProvider<GuestData>((ref) => GuestData(id: '', uid: ''));

final guestDataProvider = FutureProvider.autoDispose<GuestData?>((ref) async {
  final guest = ref.watch(guestStateProvider);
  if (guest.uid.isEmpty || guest.uid == '') {
    return null;
  }
  final client = ref.read(graphqlClientProvider);

  final result = await client.query<Query$Me>(
    QueryOptions(
      document: documentNodeQueryMe,
    ),
  );
  if (result.hasException) {
    return null;
  }

  final userData = result.data!['me'];
  return GuestData(
    id: userData['id'],
    uid: guest.uid,
  );
});
