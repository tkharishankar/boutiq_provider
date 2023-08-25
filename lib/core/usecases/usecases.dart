// 📦 Package imports:
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_tn_boutique/core/network/api_error.dart';

// 🌎 Project imports:

abstract class UseCase<Type, Params> {
  Future<Either<ApiError, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
