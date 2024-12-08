// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:widgetbook_workspace/button.dart' as _i2;
import 'package:widgetbook_workspace/components/category/input.dart' as _i3;
import 'package:widgetbook_workspace/components/item/input.dart' as _i4;
import 'package:widgetbook_workspace/components/item/input/image/select.dart'
    as _i5;
import 'package:widgetbook_workspace/components/item/input/word/select.dart'
    as _i6;
import 'package:widgetbook_workspace/features/cart/page.dart' as _i7;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'components',
    children: [
      _i1.WidgetbookFolder(
        name: 'button',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'Button',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i2.buildCoolButtonUseCase,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'category',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'Input',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i3.buildInputUseCase,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'item',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'Input',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i4.buildInputUseCase,
            ),
          ),
          _i1.WidgetbookFolder(
            name: 'input',
            children: [
              _i1.WidgetbookFolder(
                name: 'image',
                children: [
                  _i1.WidgetbookLeafComponent(
                    name: 'SelectItems',
                    useCase: _i1.WidgetbookUseCase(
                      name: 'Default',
                      builder: _i5.buildSelectItemsUseCase,
                    ),
                  )
                ],
              ),
              _i1.WidgetbookFolder(
                name: 'word',
                children: [
                  _i1.WidgetbookLeafComponent(
                    name: 'SelectWords',
                    useCase: _i1.WidgetbookUseCase(
                      name: 'Default',
                      builder: _i6.buildSelectWordsUseCase,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'features',
    children: [
      _i1.WidgetbookFolder(
        name: 'cart',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'CartPage',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i7.buildCartPageUseCase,
            ),
          )
        ],
      )
    ],
  ),
];
