import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stockkeeper/utils/style.dart';
import 'package:stockkeeper/components/item/input/word/select.dart';
import 'package:stockkeeper/components/item/input/word/text.dart';
import 'package:stockkeeper/components/item/input/word/image.dart';
import 'package:stockkeeper/graphql/searchItem.gql.dart';
import 'package:stockkeeper/providers/graphql.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stockkeeper/utils/error.dart';

const screenSelectImageAnalyze = 1;
const screenSelectWords = 2;
const screenInputText = 3;
const screenSelectImage = 4;

class InputWordForm extends HookConsumerWidget {
  final int defaultScreen;
  final List<String> defaultImages;
  final List<String> words;
  final void Function(String) onImage;
  final void Function() onCancel;

  const InputWordForm({
    super.key,
    required this.defaultScreen,
    required this.defaultImages,
    required this.words,
    required this.onImage,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final client = ref.read(graphqlClientProvider);
    final screen = useState(defaultScreen);
    final images = useState<List<String>>(defaultImages);
    final inputText = useState("");

    Future<void> onSearch(String text, bool isAnalyze) async {
      final result = await client.query<Query$SearchItem>(QueryOptions(
          document: documentNodeQuerySearchItem,
          variables: {'name': text, 'isAnalyze': isAnalyze}));

      if (!context.mounted) return;
      if (result.hasException || result.data!['searchItem'] == null) {
        showErrorDialog(context, "対象の商品が見つけられませんでした。");
        return;
      }

      images.value =
          (result.data!['searchItem']['images'] as List).cast<String>();
      screen.value = screenSelectImage;
    }

    return Container(
      height: MediaQuery.of(context).size.height - 100,
      padding: const EdgeInsets.all(Spacing.md), // 余白の調整
      child: Builder(
        builder: (context) {
          switch (screen.value) {
            case screenSelectImageAnalyze:
              return SelectItems(
                images: images.value,
                onImage: onImage,
                nextText: 'テキストで検索',
                onNext: () => screen.value = screenSelectWords,
                prevText: 'キャンセル',
                onPrev: onCancel,
              );
            case screenSelectWords:
              return SelectWords(
                onWord: (word) => {
                  inputText.value = word,
                  screen.value = screenInputText,
                },
                words: words,
                onPrev: () => screen.value = screenSelectImageAnalyze,
              );
            case screenInputText:
              return InputWordText(
                defaultValue: inputText.value,
                onPrev: () => screen.value = screenSelectWords,
                onSearch: onSearch,
              );
            case screenSelectImage:
              return SelectItems(
                images: images.value,
                onImage: onImage,
                prevText: '戻る',
                onPrev: () => screen.value = screenInputText,
              );

            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
