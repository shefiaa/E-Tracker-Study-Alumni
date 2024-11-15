import 'package:flutter/material.dart';
import '../models/alumni.dart';

class AlumniListScreen extends StatefulWidget {
  const AlumniListScreen({Key? key}) : super(key: key);

  @override
  State<AlumniListScreen> createState() => _AlumniListScreenState();
}

class _AlumniListScreenState extends State<AlumniListScreen> {
  final List<Alumni> alumniList = [
    Alumni(
      name: 'Siti Nurhaliza',
      graduationYear: '2020',
      major: 'Ilmu Komputer',
      company: 'Google',
      position: 'Software Engineer',
      avatarUrl: 'https://i.pravatar.cc/150?img=1',
    ),
    Alumni(
      name: 'Muhammad Rizky',
      graduationYear: '2021',
      major: 'Sistem Informasi',
      company: 'Microsoft',
      position: 'Product Manager',
      avatarUrl: 'https://i.pravatar.cc/150?img=2',
    ),
    Alumni(
      name: 'Ahmad Kurniawan',
      graduationYear: '2019',
      major: 'Teknik Komputer',
      company: 'Amazon',
      position: 'DevOps Engineer',
      avatarUrl: 'https://i.pravatar.cc/150?img=3',
    ),
    Alumni(
      name: 'Dewi Anggraini',
      graduationYear: '2022',
      major: 'Ilmu Data',
      company: 'Meta',
      position: 'Data Analyst',
      avatarUrl: 'https://i.pravatar.cc/150?img=4',
    ),
    Alumni(
      name: 'Budi Santoso',
      graduationYear: '2020',
      major: 'Keamanan Siber',
      company: 'IBM',
      position: 'Security Engineer',
      avatarUrl: 'https://i.pravatar.cc/150?img=5',
    ),
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredAlumni = alumniList.where((alumni) {
      final query = searchQuery.toLowerCase();
      return alumni.name.toLowerCase().contains(query) ||
          alumni.company.toLowerCase().contains(query) ||
          alumni.major.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Alumni'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Cari alumni...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredAlumni.length,
              itemBuilder: (context, index) {
                final alumni = filteredAlumni[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue[100],
                      child: Text(
                        alumni.name[0],
                        style: TextStyle(
                          color: Colors.blue[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      alumni.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          'Lulusan ${alumni.graduationYear} - ${alumni.major}',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${alumni.position} di ${alumni.company}',
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    isThreeLine: true,
                    trailing: IconButton(
                      icon: const Icon(Icons.message),
                      onPressed: () {
                        // TODO: Implement message feature
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Kirim pesan ke ${alumni.name}'),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement filter feature
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Fitur filter akan segera hadir!'),
            ),
          );
        },
        child: const Icon(Icons.filter_list),
        backgroundColor: Colors.blue[700],
      ),
    );
  }
}
