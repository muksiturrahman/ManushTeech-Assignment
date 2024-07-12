import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/albums_model.dart';
import '../states/albums_provider.dart';

class AlbumsSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    Provider.of<AlbumsProvider>(context, listen: false).searchAlbums(query);
    return _buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Provider.of<AlbumsProvider>(context, listen: false).searchAlbums(query);
    return _buildSearchResults(context);
  }

  Widget _buildSearchResults(BuildContext context) {
    return Consumer<AlbumsProvider>(
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
          backgroundColor: Colors.blue, // Example color for the avatar background
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Handle tap on the album card
        },
      ),
    );
  }
}
