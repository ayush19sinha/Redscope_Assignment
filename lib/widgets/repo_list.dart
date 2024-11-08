import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../screens/repo_detail_screen.dart';

class RepoList extends StatefulWidget {
  const RepoList({super.key});

  @override
  _RepoListState createState() => _RepoListState();
}

class _RepoListState extends State<RepoList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppProvider>().fetchRepos();
    });
  }

  void _showOwnerInfo(Map<String, dynamic> owner) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Owner Information', style: TextStyle(fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(owner['avatar_url']),
              radius: 40,
            ),
            const SizedBox(height: 16),
            Text('Username: ${owner['login']}', style: const TextStyle(fontSize: 16)),
            Text('Profile: ${owner['html_url']}', style: const TextStyle(fontSize: 14)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.grey[100],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        if (provider.repos.isEmpty) {
          return const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)));
        }

        return RefreshIndicator(
          onRefresh: () => provider.fetchRepos(),
          color: Colors.blue,
          child: ListView.builder(
            itemCount: provider.repos.length,
            itemBuilder: (context, index) {
              final repo = provider.repos[index];
              return Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RepoDetailScreen(repo: repo),
                      ),
                    );
                  },
                  onLongPress: () => _showOwnerInfo(repo['owner']),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          repo['description'] ?? 'No description',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(Icons.comment, size: 18, color: Colors.blue[600]),
                            const SizedBox(width: 6),
                            Text('${repo['comments']} comments'),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Created: ${DateTime.parse(repo['created_at']).toString().split('.')[0]}',
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          'Updated: ${DateTime.parse(repo['updated_at']).toString().split('.')[0]}',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}