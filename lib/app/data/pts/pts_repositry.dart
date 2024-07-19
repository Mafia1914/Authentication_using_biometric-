
import 'package:ecommerce_app/app/data/pts/pts_network_services.dart';
import '../network_service/network_result.dart';
import 'model/pts_respn.dart';

class PtsRepository {
  PtsRepository({required this.ptsNetworkService});

  final PtsNetworkService ptsNetworkService;

  Future<NetworkResult<List<PtsR>>> getTransactionList() async {
    var data = ptsNetworkService.getTransactionList();
    return  data;
  }
}