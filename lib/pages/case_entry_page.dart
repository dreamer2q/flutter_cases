import 'package:flutter/cupertino.dart';
import 'package:flutter_cases/pages/home_page.dart';

class CaseEntryPage extends StatefulWidget {
  const CaseEntryPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CaseEntryItem item;

  @override
  State<CaseEntryPage> createState() => _CaseEntryPageState();
}

class _CaseEntryPageState extends State<CaseEntryPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.item.title),
      ),
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.antiAlias,
          child: widget.item.builder(context),
        ),
      ),
    );
  }
}
