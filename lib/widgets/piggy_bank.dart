import 'package:flutter/cupertino.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

class PiggyBank extends StatefulWidget {
  final int? index;
  final IconData? iconData;
  final String? name;

  const PiggyBank({Key? key, this.index, this.iconData, this.name}) : super(key: key);

  @override
  State<PiggyBank> createState() => _PiggyBankState();
}

class _PiggyBankState extends State<PiggyBank> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomCard(
        width: 68,
        height: 122,
        borderRadius: 50,
        color: const Color(0xFFDDEFE8),
        child: Column(
            children: [
              CustomCard(
                child: Icon(
                  widget.iconData,
                  size: 27
                ),
                color: Color(0xFFDDEFE8),
                borderRadius: 30,
                borderColor: Color(0xFFAEE5DB),
                elevation: 0,
              ),
              const Padding(padding: EdgeInsetsDirectional.only(top: 20)),
              Text(
                widget.name!,
                style: TextStyle(fontSize: 12),
              )
            ]
        ),
      ),
    );
  }
}
