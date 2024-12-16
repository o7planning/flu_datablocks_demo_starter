part of '../model.dart';

@jsonSerializable
abstract class PageDataImpl<I> implements PageData<I> {
  @override
  @JsonProperty(name: 'pagination')
  PaginationData pagination;
  @override
  @JsonProperty(name: 'items', defaultValue: [])
  List<I> items = [];

  I? _selectedItem;

  @JsonProperty(ignore: true)
  I? get selectedItem => _selectedItem;

  PageDataImpl({
    required this.pagination,
    required this.items,
  });

  PageDataImpl.items({
    required this.items,
  }) : pagination = PaginationData(
          currentPage: 1,
          pageSize: items.length,
          totalItems: items.length,
          totalPages: 1,
        );

  PageDataImpl.item({
    required I? item,
  })  : items = item == null ? [] : [item],
        pagination = PaginationData(
          currentPage: 1,
          pageSize: 1,
          totalItems: item == null ? 0 : 1,
          totalPages: item == null ? 0 : 1,
        );

  I? getItemById({
    required String? id,
    required String Function(I it) itemToIdString,
  }) {
    if (id == null) {
      return null;
    } else {
      for (var it in items) {
        if (itemToIdString(it) == id) {
          return it;
        }
      }
      return null;
    }
  }

  void setSelectedItemById({
    required String? id,
    required String Function(I it) itemToIdString,
  }) {
    if (id == null) {
      _selectedItem = null;
    } else {
      for (var it in items) {
        if (itemToIdString(it) == id) {
          _selectedItem = it;
          return;
        }
      }
    }
  }

  void setSelectedItem({
    required I? item,
    required String Function(I it) itemToIdString,
  }) {
    if (item == null) {
      _selectedItem = null;
    } else {
      for (var it in items) {
        if (itemToIdString(it) == itemToIdString(item)) {
          _selectedItem = it;
          return;
        }
      }
    }
  }

  void replaceOrInsertItem({
    required I newItem,
    required String Function(I item) getItemIdString,
  }) {
    int idx = items.indexWhere((item) {
      return getItemIdString(item) == getItemIdString(newItem);
    });
    if (idx != -1) {
      items[idx] = newItem;
    } else {
      items.insert(0, newItem);
    }
  }

  void removeItem({
    required I removeItem,
    required String Function(I item) getItemIdString,
  }) {
    int idx = items.indexWhere((item) {
      return getItemIdString(item) == getItemIdString(removeItem);
    });
    if (idx != -1) {
      items.removeAt(idx);
    }
  }
}
