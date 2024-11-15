import 'package:flutter/material.dart';

class Job {
  final String title;
  final String company;
  final String location;
  final String type;
  final String salary;
  final String description;

  Job({
    required this.title,
    required this.company,
    required this.location,
    required this.type,
    required this.salary,
    required this.description,
  });
}

class JobInfoScreen extends StatefulWidget {
  const JobInfoScreen({Key? key}) : super(key: key);

  @override
  State<JobInfoScreen> createState() => _JobInfoScreenState();
}

class _JobInfoScreenState extends State<JobInfoScreen> {
  final List<Job> jobs = [
    Job(
      title: 'Software Engineer',
      company: 'Google',
      location: 'Mountain View, CA',
      type: 'Full-time',
      salary: 'Rp1.700.000.000 - Rp2.700.000.000',
      description: 'Mencari software engineer yang terampil untuk bergabung dengan tim kami...',
    ),
    Job(
      title: 'Data Scientist',
      company: 'Microsoft',
      location: 'Seattle, WA',
      type: 'Full-time',
      salary: 'Rp1.600.000.000 - Rp2.400.000.000',
      description: 'Bergabung dengan tim data science untuk mengerjakan proyek-proyek menarik...',
    ),
    Job(
      title: 'UX Designer',
      company: 'Apple',
      location: 'Cupertino, CA',
      type: 'Full-time',
      salary: 'Rp1.500.000.000 - Rp2.200.000.000',
      description: 'Merancang pengalaman pengguna generasi berikutnya...',
    ),
    Job(
      title: 'Product Manager',
      company: 'Amazon',
      location: 'Seattle, WA',
      type: 'Full-time',
      salary: 'Rp1.900.000.000 - Rp2.700.000.000',
      description: 'Memimpin pengembangan dan strategi produk...',
    ),
    Job(
      title: 'DevOps Engineer',
      company: 'Netflix',
      location: 'Los Gatos, CA',
      type: 'Full-time',
      salary: 'Rp1.750.000.000 - Rp2.400.000.000',
      description: 'Membangun dan memelihara infrastruktur cloud kami...',
    ),
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredJobs = jobs.where((job) {
      final query = searchQuery.toLowerCase();
      return job.title.toLowerCase().contains(query) ||
          job.company.toLowerCase().contains(query) ||
          job.location.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Informasi Lowongan Pekerjaan'),
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
                hintText: 'Cari lowongan pekerjaan...',
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
              itemCount: filteredJobs.length,
              itemBuilder: (context, index) {
                final job = filteredJobs[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue[100],
                      child: Icon(
                        Icons.work,
                        color: Colors.blue[700],
                      ),
                    ),
                    title: Text(
                      job.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '${job.company} • ${job.location}',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoRow('Tipe', job.type),
                            const SizedBox(height: 8),
                            _buildInfoRow('Gaji', job.salary),
                            const SizedBox(height: 8),
                            const Text(
                              'Deskripsi:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(job.description),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // TODO: Implement apply feature
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Melamar untuk posisi ${job.title} di ${job.company}',
                                      ),
                                    ),
                                  );
                                },
                                child: const Text('Lamar Sekarang'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
              content: Text('Fitur filter akan datang!'),
            ),
          );
        },
        child: const Icon(Icons.filter_list),
        backgroundColor: Colors.blue[700],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Text(
          '$label: ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(value),
      ],
    );
  }
}
