import '../values/app_values.dart';

class PagingController<T> {
  List<T> listItems = [];
  int pageNumber = AppValues.defaultPageNumber;
  bool isLoadingPage = false;
  bool isLoadingLoadMore = false;
  bool endOfList = false;
  get offset => listItems.length;

  initRefresh() {
    listItems = [];
    pageNumber = AppValues.defaultPageNumber;
    isLoadingPage = false;
    isLoadingLoadMore = false;
    endOfList = false;
  }

  bool canLoadNextPage() {
    return !isLoadingPage && !endOfList;
  }

  appendPage(List<T> items) {
    listItems.addAll(items);
    pageNumber++;
  }

  appendLastPage(List<T> items) {
    listItems.addAll(items);
    endOfList = true;
  }
}
