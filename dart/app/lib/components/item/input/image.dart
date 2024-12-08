import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stockkeeper/utils/image.dart';
import 'package:stockkeeper/utils/style.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:stockkeeper/components/item/barcodeScannerScreen.dart';
import 'package:stockkeeper/graphql/itemFromQR.gql.dart';
import 'package:stockkeeper/graphql/searchItem.gql.dart';
import 'package:stockkeeper/providers/graphql.dart';
import 'package:stockkeeper/components/item/input/image/select.dart';
import 'package:stockkeeper/utils/error.dart';
import 'dart:io';

class InputImage extends HookConsumerWidget {
  final String? defaultValue;
  final void Function(String) onChangeImageURL;
  final void Function(Uint8List) onChangeImageByte;

  final picker = ImagePicker();

  InputImage({
    super.key,
    this.defaultValue,
    required this.onChangeImageURL,
    required this.onChangeImageByte,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final client = ref.read(graphqlClientProvider);
    final imageByte = useState<Uint8List?>(null);

    Future<void> textRecognizer(File image) async {
      final texts = await imageTextRecognizer(image);
      if (!context.mounted) return;

      final result = await client.query<Query$SearchItem>(QueryOptions(
          document: documentNodeQuerySearchItem, variables: {'name': texts}));

      if (!context.mounted) return;
      if (result.hasException || result.data!['searchItem'] == null) {
        context.pop();

        showErrorDialog(context, "対象の商品が見つけられませんでした。");
        return;
      }
      context.pop();

      final List<String> images =
          (result.data!['searchItem']['images'] as List).cast<String>();

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SelectItems(
            images: images,
            onImage: (String url) {
              context.pop();
              onChangeImageURL(url);
            },
            nextText: 'テキストで検索',
            onNext: () {},
            onPrev: () {
              context.pop();
            },
          );
        },
      );
    }

    Future<void> setupCamera() async {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        textRecognizer(File(pickedFile.path));
      }
    }

    Future<void> setupGallery() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        textRecognizer(File(pickedFile.path));
      }
    }

    Future<void> onScan(BarcodeCapture capture, BuildContext context) async {
      final List<Barcode> barcodes = capture.barcodes;
      final value = barcodes.first.rawValue;

      if (value != null && barcodes.first.format == BarcodeFormat.ean13) {
        final String code = value;
        print('Scanned JAN code: $code');

        final result = await client.query<Query$ItemFromQR>(QueryOptions(
            document: documentNodeQueryItemFromQR,
            variables: {'janCode': code}));

        print(result.data);

        if (!context.mounted) return; // マウントチェックを追加

        if (result.hasException || result.data!['itemFromQR'] == null) {
          context.pop();
          showErrorDialog(context, "対象の商品が見つけられませんでした。");

          return;
        }
        context.pop();

        final List<String> images =
            (result.data!['itemFromQR']['images'] as List).cast<String>();

        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return SelectItems(
              images: images,
              onImage: (String url) {
                context.pop();
                onChangeImageURL(url);
              },
              onPrev: () {
                context.pop();
              },
            );
          },
        );
      }
    }

    void showScanBarcode() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            // 全画面表示するために高さを画面サイズに設定
            height: MediaQuery.of(context).size.height - 50,
            color: Colors.black,
            padding: const EdgeInsets.only(top: Spacing.lg), // 余白の調整
            child: BarcodeScannerScreen(
                onScan: (capture) => onScan(capture, context)),
          );
        },
      );
    }

    void showPickImage() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext coantext) {
          return Padding(
              padding: const EdgeInsets.only(
                  top: Spacing.md,
                  bottom: Spacing.xl,
                  left: Spacing.md,
                  right: Spacing.md), // 上に20、下に10の余白を追加
              child: Wrap(
                children: <Widget>[
                  const ListTile(
                    title: Text("画像を選択",
                        style: TextStyle(
                            fontSize: FontSize.lg,
                            fontWeight: FontWeight.bold)),
                  ),
                  ListTile(
                    leading: const Icon(Icons.qr_code_scanner),
                    title: const Text('バーコードを読み込む'),
                    onTap: () {
                      context.pop();
                      showScanBarcode();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: const Text('カメラを起動する'),
                    onTap: () async {
                      context.pop();
                      setupCamera();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.image_search),
                    title: const Text('アルバムから選択する'),
                    onTap: () async {
                      context.pop();
                      setupGallery();
                    },
                  ),
                ],
              ));
        },
      );
    }

    return InkWell(
        onTap: showPickImage,
        child: imageByte.value != null
            ? Image.memory(imageByte.value!, width: 250, height: 250)
            : defaultValue != null
                ? Image.network(defaultValue!, width: 250, height: 250)
                : Card(
                    color: Colors.black26,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // Cardの角を直角にする
                    ),
                    elevation: 0,
                    child: SizedBox(
                        width: 300,
                        height: 300,
                        child: Container(
                          width: 40,
                          height: 40,
                          padding:
                              const EdgeInsets.all(Spacing.xs), // ボーダーの幅を調整
                          child: const Icon(
                            Icons.camera_alt,
                            color: AppColors.text,
                            size: 40,
                          ),
                        ))));
  }
}
