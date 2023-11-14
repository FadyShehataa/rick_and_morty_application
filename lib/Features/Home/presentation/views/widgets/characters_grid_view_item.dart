import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_application/Features/Home/Domain/Entities/character_entity.dart';

import '../../../../../Core/utils/app_router.dart';
import '../../../../../Core/utils/constants.dart';
import '../../../../../Core/utils/styles.dart';

class CharactersGridViewItem extends StatelessWidget {
  const CharactersGridViewItem({
    super.key,
    required this.characterEntity,
  });

  final CharacterEntity characterEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kCharacterDetailsView, extra: characterEntity);
      },
      child: Hero(
        tag: characterEntity.characterImage!,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(characterEntity.characterImage!),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(kPadding),
                child: Text(
                  characterEntity.characterName!,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
