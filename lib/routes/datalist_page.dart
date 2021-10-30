import 'package:face_savior/models/person.dart';
import 'package:flutter/material.dart';

class DataListPage extends StatelessWidget {
  const DataListPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<PersonSeri> data;

  List<Widget> _buildList(context) {
    return data.map((item) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                item.img,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(fontSize: 22),
                  ),
                  if (item.desc != '')
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        item.desc,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Manager'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Wrap(
              direction: Axis.horizontal,
              children: _buildList(context),
            ),
          ),
        ),
      ),
    );
  }
}
