import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotato/constants.dart';

import '../widgets/searchbar_widget.dart';
import '../widgets/white_elevated_button.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _isLoading = false;

  final categories = [
    'Banque',
    'Santé',
    'Électricité',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: genericPadding),
          child: Column(
            children: [
              const SearchBarWidget(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Requettes Publiées',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        )),
                    Spacer(),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      RequestTileWidget(),
                      RequestTileWidget(),
                      RequestTileWidget(),
                      RequestTileWidget(),
                      RequestTileWidget(),
                      RequestTileWidget(),
                      RequestTileWidget(),
                      RequestTileWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.greyColor,
        onPressed: () {},
        child: const Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
      // bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          label: 'Accueil',
          icon: Icon(Icons.home_outlined),
        ),
        BottomNavigationBarItem(
          label: 'Rechercher',
          icon: Icon(Icons.bookmark_outline),
        ),
        BottomNavigationBarItem(
          label: 'Notifications',
          icon: Icon(Icons.notifications_outlined),
        ),
      ],
    );
  }
}

class RequestTileWidget extends StatelessWidget {
  const RequestTileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _showModalDetails() {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(),
                const Text('description'),
                Row(
                  children: [
                    const Spacer(),
                    const WhiteElevatedButton(),
                  ],
                ),
                FlutterMap(
                  options: MapOptions(),
                ),
              ],
            ),
          );
        },
      );
    }

    return GestureDetector(
      onTap: _showModalDetails,
      child: Padding(
        padding: const EdgeInsets.only(bottom: genericPadding),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(genericPadding),
            dense: true,
            leading: SvgPicture.asset(
              'assets/illustrations/banks.svg',
              height: 50,
              width: 50,
            ),
            title: const Text('BOA Banque'),
            subtitle: const Text('35 Broome St, New York'),
            trailing: WhiteElevatedButton(),
          ),
        ),
      ),
    );
  }
}
