import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../states/photos_provider.dart';
import 'full_screen_image.dart';

class PhotosPage extends StatefulWidget {
  final int userId;
  const PhotosPage({super.key, required this.userId});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<PhotosProvider>(context, listen: false).fetchPhotos(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Photos',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.teal],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Consumer<PhotosProvider>(
        builder: (context, photosProvider, child) {
          if (photosProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (photosProvider.photosList.isEmpty) {
            return Center(child: Text('No photos found.'));
          }

          // Filter photos where albumId matches userId
          final filteredPhotos = photosProvider.photosList
              .where((photo) => photo.albumId == widget.userId)
              .toList();

          if (filteredPhotos.isEmpty) {
            return Center(child: Text('No photos found for this album.'));
          }

          return _gridView(filteredPhotos);
        },
      ),
    );
  }

  Widget _gridView(List filteredPhotos) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        itemCount: filteredPhotos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to full-screen image page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreenImagePage(
                    imageUrl: filteredPhotos[index].url,
                    imageTitle: filteredPhotos[index].title,
                  ),
                ),
              );
            },
            child: GridTile(
              child: Image.network(
                filteredPhotos[index].url,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
}
}
