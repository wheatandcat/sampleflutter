import 'package:flutter/material.dart';
import 'package:stockkeeper/app/categories/page.dart';
import 'package:stockkeeper/app/login/page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockkeeper/providers/user.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AuthWrapper extends HookConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDataAsyncValue = ref.watch(userDataProvider);
    final guestDataAsyncValue = ref.watch(guestDataProvider);

    final status = useState<String>("noLogin");

    useEffect(() {
      debugPrint(
          "userDataAsyncValue01: ${userDataAsyncValue.asData?.value?.id}");
      debugPrint(
          "guestDataAsyncValue01: ${guestDataAsyncValue.asData?.value?.id}");
      if (userDataAsyncValue.asData?.value?.id != null) {
        status.value = "login";
      } else if (guestDataAsyncValue.asData?.value?.id != null) {
        status.value = "guest";
      } else {
        status.value = "noLogin";
      }

      return null;
    }, [
      userDataAsyncValue.asData?.value?.id,
      guestDataAsyncValue.asData?.value?.id,
    ]);

    if (status.value == "login") {
      return const MyHomePage();
    } else if (status.value == "guest") {
      return const MyHomePage();
    }
    return const Login();
  }
}
