import 'package:face_savior/models/person.dart';
import 'package:flutter/material.dart';

class PersonWidget extends StatelessWidget {
  const PersonWidget({Key? key, required this.person}) : super(key: key);

  final PersonSeri person;

  @override
  Widget build(BuildContext context) {
    final imageWidget = Center(
      child: Image.network(
        person.img,
        loadingBuilder: (_, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (_, err, stack) {
          return Text('Load Error: $err');
        },
      ),
    );

    return Container(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.width,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) {
                    return GestureDetector(
                      onTap: () => Navigator.of(_).pop(),
                      child: imageWidget,
                    );
                  }),
                );
              },
              child: imageWidget,
            ),
          ),
          if (person.desc.trim() != '')
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Text(
                  person.desc,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
