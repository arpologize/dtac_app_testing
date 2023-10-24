import 'package:dtac_app_testing/models/persons_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../service/rest_api_service.dart';

class MainRepository {
  final Ref ref;

  MainRepository({required this.ref});

  Future<Persons> getPersons({int size = 10}) async {
    try {
      var res = await ref.watch(apiClientProvider).get('', queryParameters: {
        'results': size,
      });
      return Persons.fromJson(res.data);
    } on DioException catch (err) {
      if (err.response?.statusCode == 401) {
        throw '${err.response?.statusCode}';
      } else {
        throw '${err.response?.statusMessage}';
      }
    }
  }
}
