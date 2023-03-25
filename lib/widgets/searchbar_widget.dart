import 'package:flutter/material.dart';

import '../constants.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: const Color.fromARGB(31, 75, 75, 75),
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: genericPadding / 2),
          border: InputBorder.none,
          hintText: 'Rechercher une requete',
          prefixIcon: const Icon(Icons.search),
          suffix: IconButton(
            onPressed: () {},
            color: Palette.greyColor,
            icon: const Icon(
              Icons.filter_list,
            ),
          ),
        ),
      ),
    );
  }
}