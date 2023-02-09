import 'package:flutter/material.dart';

class ImageList extends StatelessWidget {
  final List<String> images;

  ImageList({required this.images});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Image.asset(images[index]);
      },
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> _images = [
    "assets/image/2 piece.jpg",
    "assets/image/3 piece.jpg",
    // "assets/image/kurti.jpg",
    "assets/image/shirt.jpg",  ];
  List<String> _filteredImages = [];

  void _filterImages(value) {
    setState(() {
      _filteredImages = _images
          .where((image) => image.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterImages,
              decoration: InputDecoration(
                hintText: "Search Images",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ImageList(
              images: _filteredImages.length > 0 ? _filteredImages : _images,
            ),
          ),
        ],
      ),
    );
  }
}
