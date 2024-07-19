import 'package:get/get.dart';
import '../../../data/comments/comments_repositry.dart';
import '../../../data/comments/model/comments_respnse.dart';
import '../../../mixins/loading_mixin.dart';
import '../../../widgets/snack_bar.dart';

class SettingStore with LoadingMixin {
  final CommentsRepository repository;

  SettingStore({required this.repository});

  final _allTransactionList = RxList<CommentsRespnse>([]);

  RxList<CommentsRespnse> get allTransactionList => _allTransactionList;

  Future<void> getCommentsList() async {
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

class SettingStoreFactory {
  SettingStore create() => SettingStore(
        repository: Get.find(),
      );
}
