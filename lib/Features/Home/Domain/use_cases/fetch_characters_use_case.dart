import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_application/Core/errors/failures.dart';
import 'package:rick_and_morty_application/Core/use_cases/use_case.dart';
import 'package:rick_and_morty_application/Features/Home/Domain/Entities/character_entity.dart';
import 'package:rick_and_morty_application/Features/Home/Domain/repo/character_repo.dart';

class FetchCharactersUseCase extends UseCase<List<CharacterEntity>, NoParam> {
  final CharacterRepo characterRepo;

  FetchCharactersUseCase({required this.characterRepo});

  @override
  Future<Either<Failure, List<CharacterEntity>>> call([NoParam? param]) async {
    return await characterRepo.fetchCharacters();
  }
}
