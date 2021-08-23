import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:masters_india/core/failures.dart';
import 'package:masters_india/core/utils.dart';

import 'package:masters_india/data/model/gst_entity.dart';
import 'package:masters_india/domain/repo_usecase.dart';

class GSTRepository extends Usecase {
  final _random = new Random();

  @override
  Future<Either<ApiFailures, GSTEntity?>> searchGST(String number) async {
    try {
      Map<String, dynamic> localJson =
          await parseJsonFromAssets('assets/mock_api.jsonc');

      final res = localJson['data'] as List;

      final GSTEntity data = GSTEntity.fromJson(
          (res[_random.nextInt(res.length)] as Map<String, dynamic>));

      await Future.delayed(Duration(seconds: 2));
      return right(data);
    } catch (_) {
      return left(ApiFailures.not_found);
    }
  }
}
