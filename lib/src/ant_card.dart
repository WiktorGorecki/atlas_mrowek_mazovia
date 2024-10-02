import 'package:flutter/cupertino.dart';

class AntCard extends StatelessWidget {
  final String imageUrl;
  final String caption;
  final String description;

  const AntCard({
    super.key,
    required this.imageUrl,
    required this.caption,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("TAP");
        // Navigate to the detailed page
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => AntDetailPage(
              imageUrl: imageUrl,
              caption: caption,
              description: description,
            ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            caption,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class AntDetailPage extends StatelessWidget {
  final String imageUrl;
  final String caption;
  final String description;

  const AntDetailPage({
    super.key,
    required this.imageUrl,
    required this.caption,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(caption),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
