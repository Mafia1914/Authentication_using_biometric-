import '../network_service/network_result.dart';
import 'comments_network_services.dart';
import 'model/comments_respnse.dart';

class CommentsRepository {
  CommentsRepository({required this.commentsNetworkService});

  final CommentsNetworkService commentsNetworkService;

  Future<NetworkResult<List<CommentsRespnse>>> getTransactionList() async {
    var data = commentsNetworkService.getTransactionList();
    return  data;
  }
}