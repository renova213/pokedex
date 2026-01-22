import 'package:core/src/network/network.dart';

abstract class UseCase<R, P> {
  Future<Either<AppError, R>> call(P params);
}

class NoParams {
  const NoParams();
}
