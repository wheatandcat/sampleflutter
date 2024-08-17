import 'package:flutter/material.dart';
import 'package:stockkeeper/app/categories/page.dart';
import 'package:stockkeeper/app/login/page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stockkeeper/providers/user.dart';
import 'package:stockkeeper/providers/guest.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stockkeeper/utils/guest.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class AuthWrapper extends HookConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final g = Guest();
    final userDataAsyncValue = ref.watch(userDataProvider);
    final guestDataAsyncValue = ref.watch(guestDataProvider);
    final updateCount = useRef(0);
    final status = useState<String>("noLogin");

    void checkGuest() async {
      final guest = await g.getUid();
      if (guest != null) {
        ref.read(guestStateProvider.notifier).state =
            GuestData(id: "", uid: guest);
      }
    }

    useEffect(() {
      if (userDataAsyncValue.asData?.value?.id != null) {
        status.value = "login";
        FlutterNativeSplash.remove();
      } else if (guestDataAsyncValue.asData?.value?.id != null) {
        status.value = "guest";
        FlutterNativeSplash.remove();
      } else {
        status.value = "noLogin";
      }
      updateCount.value++;
      if (updateCount.value >= 4) {
        // 4回目の更新でスプラッシュ画面を削除
        FlutterNativeSplash.remove();
      }

      return null;
    }, [
      userDataAsyncValue.asData?.value?.id,
      guestDataAsyncValue.asData?.value?.id,
    ]);

    useEffect(() {
      checkGuest();
      return null;
    }, []);

    if (status.value == "login") {
      return const MyHomePage();
    } else if (status.value == "guest") {
      return const MyHomePage();
    }
    return const Login();
  }
}
