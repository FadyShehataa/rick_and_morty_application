import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty_application/Core/utils/constants.dart';
import 'package:rick_and_morty_application/Features/Home/Domain/Entities/character_entity.dart';

abstract class HomeLocalDataSource {
  List<CharacterEntity> fetchCharacters();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<CharacterEntity> fetchCharacters() {
    var charactersBox = Hive.box<CharacterEntity>(kCharactersBox);
    return charactersBox.values.toList();
  }
}
