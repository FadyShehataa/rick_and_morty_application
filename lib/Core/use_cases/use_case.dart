import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_application/Core/errors/failures.dart';

abstract class UseCase<T, Param> {
  Future<Either<Failure, T>> call([Param param]);
}

class NoParam {}
