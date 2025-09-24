import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_info_card.dart';
import '../widgets/custom_search_bar.dart';
import '../services/firestore_service.dart';
import '../Blocklist/add_blocklist_page.dart';

class BlocklistPage extends StatelessWidget {
  const BlocklistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final ValueNotifier<String> searchQuery = ValueNotifier('');

    final firestoreService = FirestoreService();

    return Scaffold(
      appBar: const CustomAppBar(title: 'Blocklist'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: CustomSearchBar(
              controller: searchController,
              onChanged: (value) => searchQuery.value = value,
              hintText: 'Search by name or Aadhaar...',
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<String>(
              valueListenable: searchQuery,
              builder: (context, query, _) {
                return StreamBuilder<QuerySnapshot>(
                  stream: firestoreService.getBlocklistStream(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final docs = snapshot.data!.docs;

                    final filteredDocs = docs.where((doc) {
                      final data = doc.data() as Map<String, dynamic>;
                      final name = data['name']?.toString().toLowerCase() ?? '';
                      final aadhaar =
                          data['aadhaar']?.toString().toLowerCase() ?? '';
                      return name.contains(query.toLowerCase()) ||
                          aadhaar.contains(query.toLowerCase());
                    }).toList();

                    if (filteredDocs.isEmpty) {
                      return const Center(
                        child: Text("No matching entries found."),
                      );
                    }

                    return ListView.builder(
                      itemCount: filteredDocs.length,
                      itemBuilder: (context, index) {
                        final data =
                            filteredDocs[index].data() as Map<String, dynamic>;

                        return CustomInfoCard(
                          imageUrl: data['imageUrl'] ?? '',
                          title: 'Name: ${data['name'] ?? ''}',
                          subtitle1: 'Aadhaar: ${data['aadhaar'] ?? ''}',
                          subtitle2: 'Reason: ${data['reason'] ?? ''}',
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddBlocklistPage()),
          );
        },
      ),
    );
  }
}
