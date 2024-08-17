import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stockkeeper/providers/graphql.dart';
import 'package:stockkeeper/graphql/me.gql.dart';

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
