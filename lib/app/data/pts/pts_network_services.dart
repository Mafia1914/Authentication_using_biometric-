import '../network_service/network_result.dart';
import '../network_service/network_service.dart';
import 'model/pts_respn.dart';


class PtsNetworkService extends NetworkService {
  PtsNetworkService({required super.dio});

  String getTransactionDetailsEndpoint =
      'https://jsonplaceholder.typicode.com/posts';

  Future<NetworkResult<List<PtsR>>> getTransactionList() async {
    final queryParameters = <String, dynamic>{};

    return get<NetworkResult<List<PtsR>>, List<PtsR>>(
      getTransactionDetailsEndpoint,
      queryParameters: queryParameters,
      decoder: (data) {
        if (data is List) {
          return data.map((item) => PtsR.fromJson(item)).toList();
        } else if (data is Map) {
          // If the data is a Map, convert it to Map<String, dynamic>
          final Map<String, dynamic> typedData =
              Map<String, dynamic>.from(data);
          return [PtsR.fromJson(typedData)];
        } else {
          throw Exception('Invalid data type');
        }
      },
      onSuccess: (response) => NetworkResult.success(response),
      onError: (error) => NetworkResult.error(error?.errorMessage),
    );
  }
}
