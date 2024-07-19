import 'package:get/get.dart';
import '../../../mixins/loading_mixin.dart';

class ProfileStore with LoadingMixin {
  final _email = RxString('');

  RxString get email => _email;
}

class ProfileStoreFactory {
  ProfileStore create() => ProfileStore();
}
