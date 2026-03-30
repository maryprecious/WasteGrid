import 'package:flutter/material.dart';

class EarningScreen extends StatefulWidget {
  const EarningScreen({super.key});

  @override
  State<EarningScreen> createState() => _EarningScreenState();
}

class _EarningScreenState extends State<EarningScreen> {
  int selectedIndex = 0;
  bool isHidden = false;
  bool sendMode = true;

  final List<String> tabs = ['Challenges', 'Redeem', 'Leaderboard'];

  final List<Map<String, dynamic>> challengeItems = [
    {
      'title': 'Sort & Earn',
      'description': 'Sort 5 recyclables',
      'reward': '100 points',
      'progress': 1,
      'target': 5,
      'status': 'Ongoing',
      'type': 'Weekly',
      'isUpcoming': false,
    },
    {
      'title': 'Community Impact',
      'description': 'Refer 5 friends',
      'reward': '500 points',
      'progress': 1,
      'target': 5,
      'status': 'Upcoming',
      'type': 'Monthly',
      'isUpcoming': true,
    },
  ];

  final List<bool> redeemPanelExpanded = [false, false, false, false];

  final Map<String, int> selectedRedeemIndex = {
    'Airtime': 0,
    'Data': 0,
    'Supermarket': 0,
    'Kiosk': 0,
  };

  final List<Map<String, dynamic>> redeemCatalog = [
    {
      'category': 'Airtime',
      'items': [
        {'label': '₦100', 'cost': 500},
        {'label': '₦200', 'cost': 1000},
        {'label': '₦500', 'cost': 2500},
      ],
      'info': 'Enter mobile number to receive airtime top-up.',
    },
    {
      'category': 'Data',
      'items': [
        {'label': '150MB', 'cost': 500},
        {'label': '350MB', 'cost': 1000},
        {'label': '1GB', 'cost': 2500},
      ],
      'info': 'Choose network and amount; redeem points for data bundles.',
    },
    {
      'category': 'Supermarket',
      'items': [
        {'label': 'Shoprite', 'cost': 1200},
        {'label': 'Spar', 'cost': 1600},
        {'label': 'Justrite', 'cost': 2000},
      ],
      'info':
          'Use voucher code in-store to redeem points at partnered supermarkets.',
    },
    {
      'category': 'Kiosk',
      'items': [
        {'label': 'Local Mart', 'cost': 800},
        {'label': 'Corner Shop', 'cost': 1100},
        {'label': 'Green Kiosk', 'cost': 1400},
      ],
      'info': 'Redeem here for small daily essentials.',
    },
  ];

  final List<Map<String, dynamic>> leaderboard = [
    {
      'name': 'David Smith',
      'rank': 'Novice',
      'progress': 0.2,
      'points': 2535,
      'level': 'Novice',
    },
    {'level': 'Beginner', 'progress': 0.4},
    {'level': 'Junior', 'progress': 0.55},
    {'level': 'Intermediate', 'progress': 0.7},
    {'level': 'Senior', 'progress': 0.82},
    {'level': 'Elite', 'progress': 0.92},
    {'level': 'Master', 'progress': 0.98},
    {'level': 'Veteran', 'progress': 0.99},
    {'level': 'Addict', 'progress': 0.995},
    {'level': 'Guru', 'progress': 0.999},
    {'level': 'Legend', 'progress': 0.9995},
    {'level': 'Waste God', 'progress': 1},
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
          'Earn',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.more_vert, color: Colors.green, size: 28),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPointsCard(),
              const SizedBox(height: 20),
              _buildTransferButtons(),
              const SizedBox(height: 20),
              _buildTabButtons(),
              const SizedBox(height: 16),
              if (selectedIndex == 0) _buildChallenges(),
              if (selectedIndex == 1) _buildRedeemSection(),
              if (selectedIndex == 2) _buildLeaderboard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPointsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0F7F2F), Color(0xFF3BCE54)],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Total Earnings',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () => setState(() => isHidden = !isHidden),
                icon: Icon(
                  isHidden ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            isHidden ? '****' : '2,535',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 46,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Points',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 10),
          const Divider(color: Colors.white30),
          const SizedBox(height: 8),
          const Text(
            'Today\'s 500 Points',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildTransferButtons() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => setState(() => sendMode = true),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: sendMode ? Colors.green : Colors.black,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text(
                  'Send',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: GestureDetector(
            onTap: () => setState(() => sendMode = false),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: sendMode ? Colors.black : Colors.green,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text(
                  'Receive',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _actionButton(String label, IconData icon, Color color) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: () {
          if (label == 'Leaderboard') {
            setState(() => selectedIndex = 2);
          } else if (label == 'Redeem') {
            setState(() => selectedIndex = 1);
          } else {
            setState(() => selectedIndex = 0);
          }
        },
        icon: Icon(icon, size: 18),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget _buildTabButtons() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final active = selectedIndex == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => selectedIndex = index),
              child: Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: active ? Colors.green : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  tabs[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: active ? Colors.white : Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildChallenges() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Weekly Challenge',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildChallengeCard(challengeItems[0]),
        const SizedBox(height: 16),
        const Text(
          'Monthly Challenge',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildChallengeCard(challengeItems[1]),
      ],
    );
  }

  Widget _buildChallengeCard(Map<String, dynamic> challenge) {
    final progress = challenge['progress'] / challenge['target'];
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 90,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/leadheart.png.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: challenge['status'] == 'Upcoming'
                                  ? Colors.orange.shade100
                                  : Colors.green.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              challenge['status'],
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: challenge['status'] == 'Upcoming'
                                    ? Colors.orange.shade800
                                    : Colors.green.shade800,
                              ),
                            ),
                          ),
                          if (challenge['isUpcoming'] == true)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                'Upcoming',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          Row(
                            children: [
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const Text('Done'),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const Text('Start'),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        challenge['title'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        challenge['description'],
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.monetization_on,
                            color: Colors.green,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            challenge['reward'],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinearProgressIndicator(
                  value: progress,
                  color: Colors.green,
                  backgroundColor: Colors.green.shade100,
                ),
                const SizedBox(height: 8),
                Text(
                  '${challenge['progress']} of ${challenge['target']}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRedeemSection() {
    return ExpansionPanelList(
      expandedHeaderPadding: EdgeInsets.zero,
      expansionCallback: (index, expanded) {
        setState(() {
          for (var i = 0; i < redeemPanelExpanded.length; i++) {
            redeemPanelExpanded[i] = false;
          }
          redeemPanelExpanded[index] = !expanded;
        });
      },
      children: List.generate(redeemCatalog.length, (index) {
        final item = redeemCatalog[index];
        final String category = item['category'];
        final List<Map<String, dynamic>> items =
            List<Map<String, dynamic>>.from(item['items']);
        final selectedIndex = selectedRedeemIndex[category] ?? 0;

        return ExpansionPanel(
          isExpanded: redeemPanelExpanded[index],
          headerBuilder: (context, expanded) {
            return ListTile(
              leading: Icon(
                category == 'Airtime'
                    ? Icons.phone_iphone
                    : category == 'Data'
                    ? Icons.signal_cellular_alt
                    : category == 'Supermarket'
                    ? Icons.storefront
                    : Icons.local_mall,
                color: Colors.green,
              ),
              title: Text(
                category,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text('Selected: ${items[selectedIndex]['label']}'),
            );
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (category == 'Airtime' || category == 'Data')
                  Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.person, color: Colors.green),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            '08154024042',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Icon(Icons.check_circle, color: Colors.green),
                      ],
                    ),
                  ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item['info'],
                        style: const TextStyle(color: Colors.black54),
                      ),
                      const Icon(
                        Icons.info_outline,
                        size: 18,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                if (category == 'Supermarket' || category == 'Kiosk')
                  Column(
                    children: items.asMap().entries.map((entry) {
                      final itemIndex = entry.key;
                      final product = entry.value;
                      final isSelected = itemIndex == selectedIndex;
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: isSelected
                              ? Colors.green
                              : Colors.grey.shade300,
                          child: Icon(
                            Icons.store,
                            color: isSelected ? Colors.white : Colors.black54,
                          ),
                        ),
                        title: Text(product['label']),
                        subtitle: Text('Pay ${product['cost']}p'),
                        trailing: Text(
                          isSelected ? 'Selected' : 'Redeem',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.green : Colors.black54,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selectedRedeemIndex[category] = itemIndex;
                          });
                        },
                      );
                    }).toList(),
                  )
                else
                  SizedBox(
                    height: 140,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, itemIndex) {
                        final product = items[itemIndex];
                        final isSelected = itemIndex == selectedIndex;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedRedeemIndex[category] = itemIndex;
                            });
                          },
                          child: Container(
                            width: 120,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.green : Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: isSelected
                                    ? Colors.green
                                    : Colors.grey.shade300,
                                width: 1.2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.06),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product['label'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Pay ${product['cost']}p',
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white70
                                        : Colors.black54,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isSelected
                                          ? Colors.black
                                          : Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: Text(
                                      isSelected ? 'Selected' : 'Redeem',
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildLeaderboard() {
    final currentUser = leaderboard.first;
    final double userProgress = (currentUser['progress'] as num).toDouble();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.green.shade100,
                child: const Icon(Icons.person, color: Colors.green),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentUser['name'] ?? 'Player',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      currentUser['rank'] ?? (currentUser['level'] ?? 'Novice'),
                      style: const TextStyle(color: Colors.orange),
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: userProgress.clamp(0.0, 1.0),
                      color: Colors.green,
                      backgroundColor: Colors.green.shade100,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${(userProgress * 100).toInt()}% to Next Level',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${currentUser['points'] ?? 0} pts',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ...leaderboard.skip(1).map((lvl) {
          final levelProgress = (lvl['progress'] as num).toDouble();
          final bool unlocked = levelProgress <= userProgress;
          return ListTile(
            leading: Icon(
              unlocked ? Icons.star : Icons.lock,
              color: unlocked ? Colors.amber : Colors.grey,
            ),
            title: Text(
              lvl['level'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '${(levelProgress * 100).toInt()}% progress',
              style: const TextStyle(fontSize: 12),
            ),
            trailing: unlocked
                ? const Icon(Icons.check_circle, color: Colors.green)
                : null,
          );
        }).toList(),
      ],
    );
  }
}
