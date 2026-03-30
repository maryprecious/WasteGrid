import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Community', style: TextStyle(color: Colors.black87)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: const CommunityHomepage(),
    );
  }
}

class CommunityHomepage extends StatefulWidget {
  const CommunityHomepage({super.key});

  @override
  State<CommunityHomepage> createState() => _CommunityHomepageState();
}

class _CommunityHomepageState extends State<CommunityHomepage> {
  int _selectedTab = 1;

  final List<Map<String, String>> _events = [
    {
      'title': 'Operation keep it clean',
      'subtitle': 'Nigeria • May 25, 2025',
      'image': 'assets/images/operationkeep.png.jpg',
    },
    {
      'title': 'LeadHeart Initiative',
      'subtitle': 'Nigeria • May 25, 2025',
      'image': 'assets/images/leadheart.png.jpg',
    },
    {
      'title': 'Repair Cafés',
      'subtitle': 'Nigeria • May 25, 2025',
      'image': 'assets/images/3rdpicswaste.jpg',
    },
    {
      'title': 'Global Recycling Day',
      'subtitle': 'Nigeria • May 25, 2025',
      'image': 'assets/images/4thpicswaste.jpg',
    },
    {
      'title': 'Clean-up Campaigns',
      'subtitle': 'Nigeria • May 25, 2025',
      'image': 'assets/images/leadheart.png.jpg',
    },
  ];

  List<Map<String, String>> get _activeEvents => _events;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          _buildSearchBar(),
          const SizedBox(height: 12),
          _buildTabBar(),
          const SizedBox(height: 12),
          Expanded(child: _buildEventList()),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        hintText: 'Search',
        hintStyle: const TextStyle(color: Colors.green),
        prefixIcon: const Icon(Icons.search, color: Colors.green),
        suffixIcon: const Icon(Icons.filter_list, color: Colors.green),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.green),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    final tabs = ['News', 'Events', 'My Events'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(tabs.length, (index) {
        final active = _selectedTab == index;
        return Expanded(
          child: GestureDetector(
            onTap: () => setState(() => _selectedTab = index),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: active ? Colors.green.shade100 : Colors.white,
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                tabs[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: active ? Colors.green : Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildEventList() {
    return ListView.builder(
      itemCount: _activeEvents.length,
      itemBuilder: (context, index) {
        final item = _activeEvents[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green.shade50),
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                item['image']!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              item['title']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(item['subtitle']!),
            trailing: const Icon(Icons.favorite_border, color: Colors.grey),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => CommunityDetailScreen(event: item),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CommunityDetailScreen extends StatefulWidget {
  final Map<String, String> event;

  const CommunityDetailScreen({super.key, required this.event});

  @override
  State<CommunityDetailScreen> createState() => _CommunityDetailScreenState();
}

class _CommunityDetailScreenState extends State<CommunityDetailScreen> {
  bool _joined = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
          ),
          onPressed: () => Get.back(),
        ),
        title: const Text('Community', style: TextStyle(color: Colors.black87)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.black87),
            onSelected: (value) {
              if (value == 'Edit Events') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const CommunityEditEventsScreen(),
                  ),
                );
              } else if (value == 'About Events') {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Coming Soon')));
              }
            },
            itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem(value: 'Edit Events', child: Text('Edit Events')),
                PopupMenuItem(
                  value: 'About Events',
                  child: Text('About Events'),
                ),
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                widget.event['image']!,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              widget.event['title']!,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Non governmental|Non profit|Entrepreneurship|Leadership|Humanitarian service',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 12),
            const Text(
              'Organizer: Olayode Micheal Abiodun',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              'Ogun State Clean Up',
              style: TextStyle(color: Colors.green),
            ),
            const Text(
              'July 22, 2025',
              style: TextStyle(color: Colors.black54),
            ),
            const Text(
              'Funnab Gate, Abeokuta',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _iconLabel(
                  Icons.chat,
                  'Chat',
                  () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const CommunityChatScreen(),
                    ),
                  ),
                ),
                _iconLabel(Icons.people, 'Members', () => {}),
                _iconLabel(Icons.share, 'Share', () => {}),
              ],
            ),
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => setState(() => _joined = !_joined),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(
                  _joined ? 'Leave' : 'Join',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconLabel(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}

class CommunityEditEventsScreen extends StatelessWidget {
  const CommunityEditEventsScreen({super.key});

  final List<Map<String, String>> events = const [
    {
      'title': 'Operation keep it clean',
      'subtitle': 'Nigeria • May 25, 2025',
      'image': 'assets/images/operationkeep.png.jpg',
    },
    {
      'title': 'LeadHeart Initiative',
      'subtitle': 'Nigeria • May 25, 2025',
      'image': 'assets/images/leadheart.png.jpg',
    },
    {
      'title': 'Repair Cafés',
      'subtitle': 'Nigeria • May 25, 2025',
      'image': 'assets/images/3rdpicswaste.jpg',
    },
    {
      'title': 'Global Recycling Day',
      'subtitle': 'Nigeria • May 25, 2025',
      'image': 'assets/images/4thpicswaste.jpg',
    },
    {
      'title': 'Clean-up Campaigns',
      'subtitle': 'Nigeria • May 25, 2025',
      'image': 'assets/images/leadheart.png.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Edit events',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final item = events[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green.shade50),
              borderRadius: BorderRadius.circular(14),
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  item['image']!,
                  width: 52,
                  height: 52,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                item['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item['subtitle']!),
              trailing: const Icon(Icons.edit, color: Colors.green),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}

class CommunityChatScreen extends StatelessWidget {
  const CommunityChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
          ),
          onPressed: () => Get.back(),
        ),
        title: const Text('Chat', style: TextStyle(color: Colors.black87)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                _ChatBubble(
                  text: 'Hello, Welcome Please introduce yourself',
                  isSent: false,
                  author: 'Admin',
                  timestamp: '2 hrs',
                ),
                _ChatBubble(
                  text: 'Hi, I’m David. It’s nice to be here!!',
                  isSent: true,
                  author: 'David',
                  timestamp: '2 hrs',
                ),
                _ChatBubble(
                  text: 'Hello dear, you are welcome',
                  isSent: false,
                  author: 'Amara',
                  timestamp: '2 hrs',
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey.shade200,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Add a Comment',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final String text;
  final bool isSent;
  final String author;
  final String timestamp;

  const _ChatBubble({
    required this.text,
    required this.isSent,
    required this.author,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    final alignment = isSent ? Alignment.centerRight : Alignment.centerLeft;
    final color = isSent ? Colors.green.shade50 : Colors.white;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      alignment: alignment,
      child: Column(
        crossAxisAlignment: isSent
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Text(
            author,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              border: Border.all(color: Colors.green.shade100),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(text, style: const TextStyle(fontSize: 14)),
          ),
          const SizedBox(height: 4),
          Text(
            timestamp,
            style: const TextStyle(fontSize: 12, color: Colors.black45),
          ),
        ],
      ),
    );
  }
}
