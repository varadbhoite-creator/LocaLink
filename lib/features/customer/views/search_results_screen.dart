import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({super.key});

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _hasSearched = false;

  final List<String> _recentSearches = [
    'Plumber near me',
    'Organic Grocery',
    'Electrician',
    'Public Park',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        title: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search services, shops, or places...',
            border: InputBorder.none,
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear, color: AppColors.secondary),
                    onPressed: () {
                      _searchController.clear();
                      setState(() => _hasSearched = false);
                    },
                  )
                : null,
          ),
          onSubmitted: (query) {
            if (query.trim().isNotEmpty) {
              setState(() => _hasSearched = true);
            }
          },
        ),
      ),
      body: _hasSearched ? _buildSearchResults() : _buildRecentSearches(),
    );
  }

  Widget _buildRecentSearches() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Recent Searches',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        ..._recentSearches.map((term) => ListTile(
              leading: const Icon(Icons.history, color: AppColors.secondary),
              title: Text(term),
              trailing: const Icon(Icons.north_west, size: 16, color: AppColors.secondary),
              contentPadding: EdgeInsets.zero,
              onTap: () {
                _searchController.text = term;
                setState(() => _hasSearched = true);
              },
            )),
      ],
    );
  }

  Widget _buildSearchResults() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Card(
          elevation: 0,
          margin: const EdgeInsets.only(bottom: 12),
          color: AppColors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: AppColors.border),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.search, color: AppColors.primary),
            ),
            title: Text('Search Result #${index + 1} for "${_searchController.text}"'),
            subtitle: const Text('Local Store / Service • 1.5 km away'),
            trailing: const Icon(Icons.chevron_right, color: AppColors.secondary),
            onTap: () {},
          ),
        );
      },
    );
  }
}