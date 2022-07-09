import 'dart:async';

import 'package:flutter/material.dart';

typedef FetchItemCallBack = Future<List<BottomSheetSelectorItem>?> Function(
    String);

enum BottomSheetInitItemsBehavior {
  // will call fetchItems api after call update function
  onUpdate,
  // will call fetchItems api after call showBottomSheet
  onShowBottomSheet,
}

class BottomSheetSelectorItem<T> {
  BottomSheetSelectorItem({
    required this.id,
    required this.value,
    this.extraValue,
  });

  final String id;
  final String value;
  final T? extraValue;

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is! BottomSheetSelectorItem) return false;
    final BottomSheetSelectorItem item = other;
    return id == item.id && value == item.value;
  }
}

class BottomSheetSelectorController extends ChangeNotifier {
  BottomSheetSelectorController({
    this.initItemsBehavior = BottomSheetInitItemsBehavior.onUpdate,
  });

  final searchController = TextEditingController();
  FetchItemCallBack? onFetchItems;
  List<BottomSheetSelectorItem> selectedItems = [];
  List<BottomSheetSelectorItem> items = [];
  final BottomSheetInitItemsBehavior initItemsBehavior;
  bool isLoading = false;
  Timer? debounce;

  String get text => selectedItems.map((e) => e.value).toList().join(', ');

  void update({
    FetchItemCallBack? onFetchItems,
    List<BottomSheetSelectorItem>? items,
    List<BottomSheetSelectorItem>? selectedItems,
  }) async {
    this.onFetchItems = onFetchItems;
    if (selectedItems != null) {
      this.selectedItems = selectedItems;
    }
    if (items != null) {
      this.items = items;
    }
    notifyListeners();
    if (initItemsBehavior == BottomSheetInitItemsBehavior.onUpdate &&
        onFetchItems != null) {
      isLoading = true;
      final initialItems = await onFetchItems.call('');
      if (initialItems != null) {
        this.items = initialItems;
      }
      isLoading = false;
      notifyListeners();
    }
  }

  void showBottomSheet() async {
    if (initItemsBehavior == BottomSheetInitItemsBehavior.onShowBottomSheet &&
        onFetchItems != null &&
        items.isEmpty &&
        searchController.text == '') {
      isLoading = true;
      final initialItems = await onFetchItems?.call('');
      if (initialItems != null) {
        items = initialItems;
      }
      isLoading = false;
      notifyListeners();
    }
  }

  bool isSelected(BottomSheetSelectorItem item) {
    return selectedItems.contains(item);
  }

  // void handleOnItemPressed(BottomSheetSelectorItem item) {
  //   if (mode == BottomSheetSelectorMode.single) {
  //     if (selectedItems.isEmpty) {
  //       selectedItems.add(item);
  //       Get.back();
  //     } else if (selectedItems.first != item) {
  //       selectedItems[0] = item;
  //       Get.back();
  //     } else {
  //       if (allowNull) selectedItems.clear();
  //     }
  //   } else {
  //     final isSelected = selectedItems.contains(item);
  //     if (isSelected != true) {
  //       selectedItems.add(item);
  //     } else {
  //       selectedItems.removeWhere((e) => e == item);
  //     }
  //   }
  //   notifyListeners();
  // }
}
