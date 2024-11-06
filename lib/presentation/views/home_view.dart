import 'package:flutter/material.dart';

import '../../logic/models/company.dart';
import '../components/neumorphic_box.dart';

class HomeView extends StatelessWidget {
  final List<Company> companies;
  const HomeView({super.key, required this.companies});

  @override
  Widget build(BuildContext context) {
    //
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      //
      backgroundColor: const Color(0xFFE0E0E0),

      body: CustomScrollView(
        slivers: [
          //
          const SliverAppBar.large(
            title: Text('Tractian'),
            backgroundColor: Color(0xFFE0E0E0),
          ),

          //
          SliverToBoxAdapter(
            child: SizedBox(
              //
              width: size.width * .9,
              height: size.height * .6,

              child: ListView.builder(
                itemCount: companies.length,
                itemBuilder: (_, i) {
                  //
                  final Company company = companies[i];

                  return Padding(
                    //
                    padding: const EdgeInsets.symmetric(vertical: 15),

                    child: NeumorphicBox(
                      label: company.name,
                      callBack: () {},
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
