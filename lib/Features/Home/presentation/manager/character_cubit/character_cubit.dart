import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_application/Features/Home/Domain/Entities/character_entity.dart';
import 'package:rick_and_morty_application/Features/Home/Domain/use_cases/fetch_characters_use_case.dart';

part 'character_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this.fetchCharactersUseCase) : super(CharactersInitial());

  final FetchCharactersUseCase fetchCharactersUseCase;

  late final List<CharacterEntity> characters;
  late List<CharacterEntity> searchedCharacters = [];

  Future<void> searchCharacter(String query) async {
    emit(CharactersSearching());
    searchedCharacters = characters
        .where((element) => element.characterName!
            .toLowerCase()
            .startsWith(query.toLowerCase()))
        .toList();
    emit(CharactersSuccess());
  }

  Future<void> fetchCharacters() async {
    emit(CharactersLoading());
    var result = await fetchCharactersUseCase.call();

    result.fold(
      (failure) => emit(CharactersFailure(errMessage: failure.errMessage)),
      (characters) {
        searchedCharacters = characters;
        this.characters = characters;
        emit(CharactersSuccess());
      },
    );
  }
}
