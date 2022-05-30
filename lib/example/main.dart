import 'package:flutter/material.dart';
import 'package:graph_gap/graph_gap.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GraphGap(
          widthGraph: 60,
          horizontalSeparation: 20,
          verticalSize: 300,
          horizontalSize: 300,
          titles: const ["January", "February", "March", "April"],
          values: const [
            10,
            30,
            25.3,
            0,
          ],
        ),
      ),
    );
  }
}
