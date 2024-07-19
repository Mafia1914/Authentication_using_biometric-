import 'package:get/get.dart';
import '../../../mixins/loading_mixin.dart';

class SearchStore with LoadingMixin {
  final _email = RxString('');

  RxString get email => _email;
  final RxString selectedImage = RxString('');

}

class SearchStoreFactory {
  SearchStore create() => SearchStore();
}
