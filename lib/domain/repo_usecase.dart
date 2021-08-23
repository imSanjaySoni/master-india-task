import 'package:dartz/dartz.dart';
import 'package:masters_india/core/failures.dart';
import 'package:masters_india/data/model/gst_entity.dart';

abstract class Usecase {
  Future<Either<ApiFailures, GSTEntity?>> searchGST(String number);
}
