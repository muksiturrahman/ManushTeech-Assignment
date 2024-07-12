import 'package:flutter/material.dart';
import 'package:manushtech_assignment/pages/photos.dart';
import 'package:provider/provider.dart';
import 'package:manushtech_assignment/models/albums_model.dart';
import '../states/albums_provider.dart';
import '../widgets/search_delegate.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({super.key});

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AlbumsProvider>(context, listen: false).fetchAlbums(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Albums',
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
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: AlbumsSearchDelegate());
            },
          ),
        ],
      ),

      body: Consumer<AlbumsProvider>(
        builder: (context, albumsProvider, child) {
          if (albumsProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (albumsProvider.albumsList.isEmpty) {
            return const Center(child: Text('No albums found.'));
          }

          return ListView.builder(
            itemCount: albumsProvider.albumsList.length,
            itemBuilder: (context, index) {
              return _buildAlbumCard(albumsProvider.albumsList[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildAlbumCard(AlbumsModel album) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        title: Text(
          album.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'User ID: ${album.userId}',
          style: TextStyle(fontSize: 14),
        ),
        leading: CircleAvatar(
          child: Text(
            album.id.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>PhotosPage(userId: album.id,)));
        },
      ),
    );
  }
}
