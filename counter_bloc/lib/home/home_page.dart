import 'package:flutter/material.dart';

import '../widgets/button_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 16.0,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ButtonCard(
                onTap: () {
                  Navigator.of(context).pushNamed('/bloc');
                },
                label: 'Bloc Counter',
              ),
              ButtonCard(
                onTap: () {
                  Navigator.of(context).pushNamed('/cubit');
                },
                label: 'Cubit Counter',
              ),
              ButtonCard(
                onTap: () {
                  Navigator.of(context).pushNamed('/bloc/example/');
                },
                label: 'Bloc Names',
              ),
              ButtonCard(
                onTap: () {
                  //Navigator.of(context).pushNamed('/cubit/example/');
                },
                label: 'Cubit Names',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
