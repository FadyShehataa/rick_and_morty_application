import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_application/Core/errors/failures.dart';
import 'package:rick_and_morty_application/Features/Home/Domain/Entities/character_entity.dart';
import 'package:rick_and_morty_application/Features/Home/Domain/repo/home_repo.dart';

import '../../../../Core/use_cases/no_param_use_case.dart';

class FetchCharactersUseCase extends UseCase<List<CharacterEntity>> {
  final HomeRepo homeRepo;

  FetchCharactersUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<CharacterEntity>>> call() async {
    return await homeRepo.fetchCharacters();
  }
}
