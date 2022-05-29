import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

import '../widgets/piggy_bank.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<PiggyBank> piggyBanks;

  @override
  void initState() {
    super.initState();

    // piggyBanks = Iterable<PiggyBank>.generate(6, (i) => PiggyBank(
    //   index: i,
    //   iconData: CupertinoIcons.sparkles,
    //   name: "something cool"
    // )).toList();

    piggyBanks = [
      PiggyBank(
        index: 1,
        iconData: CupertinoIcons.airplane,
        name: "Airplane"
      ),
      PiggyBank(
          index: 2,
          iconData: CupertinoIcons.car,
          name: "Car"
      ),
      PiggyBank(
          index: 3,
          iconData: CupertinoIcons.flame,
          name: "Emergency"
      ),
      PiggyBank(
          index: 4,
          iconData: CupertinoIcons.plus,
          name: "Add new"
      ),
      PiggyBank(
          index: 5,
          iconData: CupertinoIcons.plus,
          name: "eeee"
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
     child: Container(
       decoration: const BoxDecoration(
         color: Color(0xFFAEE5DB)
       ),
       child: Column(
         children: [
           const Padding(padding: EdgeInsetsDirectional.only(top: 10)),
           SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child: Row(
               children: piggyBanks.isNotEmpty ? piggyBanks : [],
             ),
           )
         ],
       ),
     )
    );
  }
}
