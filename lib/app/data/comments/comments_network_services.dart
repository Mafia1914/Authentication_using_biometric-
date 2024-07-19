import '../network_service/network_result.dart';
import '../network_service/network_service.dart';
import 'model/comments_respnse.dart';


class CommentsNetworkService extends NetworkService {
  CommentsNetworkService({required super.dio});

  String getTransactionDetailsEndpoint =
      'https://jsonplaceholder.typicode.com/comments';

  Future<NetworkResult<List<CommentsRespnse>>> getTransactionList() async {
    final queryParameters = <String, dynamic>{};

    return get<NetworkResult<List<CommentsRespnse>>, List<CommentsRespnse>>(
      getTransactionDetailsEndpoint,
      queryParameters: queryParameters,
      decoder: (data) {
        if (data is List) {
          return data.map((item) => CommentsRespnse.fromJson(item)).toList();
        } else if (data is Map) {
          // If the data is a Map, convert it to Map<String, dynamic>
          final Map<String, dynamic> typedData =
          Map<String, dynamic>.from(data);
          return [CommentsRespnse.fromJson(typedData)];
        } else {
          throw Exception('Invalid data type');
        }
      },
      onSuccess: (response) => NetworkResult.success(response),
      onError: (error) => NetworkResult.error(error?.errorMessage),
    );
  }
}
