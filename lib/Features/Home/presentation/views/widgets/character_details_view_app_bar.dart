import 'package:flutter/material.dart';
import 'package:rick_and_morty_application/Features/Home/Domain/Entities/character_entity.dart';
import '../../../../../Core/utils/styles.dart';

import '../../../../../Core/utils/my_colors.dart';

class CharacterDetailsViewAppBar extends StatelessWidget {
  const CharacterDetailsViewAppBar({super.key, required this.characterEntity});

  final CharacterEntity characterEntity;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.appBarColor,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          characterEntity.characterName!,
          style: Styles.textStyle22.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        background: Hero(
          tag: characterEntity.characterName!, // TODO
          child: Image.network(
            characterEntity.characterImage!,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
