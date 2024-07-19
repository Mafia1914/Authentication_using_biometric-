import 'package:get/get.dart';
import '../../../data/pts/model/pts_respn.dart';
import '../../../data/pts/pts_repositry.dart';
import '../../../mixins/loading_mixin.dart';
import '../../../widgets/snack_bar.dart';

// class NewsStore with LoadingMixin {
//   final PtsRepository repository;
//   NewsStore({required this.repository});
//
//   final _allTransactionList = RxList<PtsRepository>([]);
//
//   RxList<PtsRepository> get allTransactionList => _allTransactionList;
//
//   Future<void> getTransactionList() async {
//     allTransactionList.clear();
//
//     final result = await repository.getTransactionList();
//
//     result.when(
//       success: (payload) {
//         if (payload != null) {
//           allTransactionList.value = payload;
//         }
//       },
//       error: (message) {
//         showErrorSnackbar(message: 'An error occurred');
//       },
//     );
//   }
// }
//
// class NewsStoreFactory {
//   NewsStore create() => NewsStore(
//         repository: Get.find(),
//       );
// }


class NewsStore with LoadingMixin {
  final PtsRepository repository;
  NewsStore({required this.repository});

  final _allTransactionList = RxList<PtsR>([]);

  RxList<PtsR> get allTransactionList => _allTransactionList;

  Future<void> getTransactionList() async {
    allTransactionList.clear();

    final result = await repository.getTransactionList();

    result.when(
      success: (payload) {
        if (payload != null) {
          allTransactionList.value = payload;
        }
      },
      error: (message) {
        showErrorSnackbar(message: 'An error occurred');
      },
    );
  }
}

class NewsStoreFactory {
  NewsStore create() => NewsStore(
    repository: Get.find(),
  );
}
