import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Dashboard', style: TextStyle(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      drawer: _buildModernDrawer(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildWelcomeSection(),
              const SizedBox(height: 24),
              _buildStatsCards(),
              const SizedBox(height: 28),
              const Text(
                'Quick Actions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 16),
              _buildQuickActionsGrid(),
              const SizedBox(height: 28),
              _buildRecentActivity(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModernDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal.shade700, Colors.teal.shade500],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.teal.shade100,
                      child: Text(
                        'JD',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Dr. John Doe',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Cardiologist',
                    style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                children: [
                  _buildDrawerItem(context, Icons.dashboard_rounded, 'Dashboard', true),
                  _buildDrawerItem(context, Icons.people_rounded, 'Patients', false),
                  _buildDrawerItem(context, Icons.calendar_month_rounded, 'Appointments', false),
                  _buildDrawerItem(context, Icons.medical_services_rounded, 'Prescriptions', false),
                  _buildDrawerItem(context, Icons.analytics_rounded, 'Analytics', false),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Divider(height: 1),
                  ),
                  _buildDrawerItem(context, Icons.settings_rounded, 'Settings', false),
                  _buildDrawerItem(context, Icons.help_rounded, 'Help & Support', false),
                ],
              ),
            ),
            const Divider(height: 1),
            _buildDrawerItem(context, Icons.logout_rounded, 'Logout', false, isLogout: true),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title, bool isSelected, {bool isLogout = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: isSelected ? Colors.teal.shade50 : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isLogout ? Colors.red.shade600 : (isSelected ? Colors.teal.shade700 : Colors.grey.shade700),
          size: 24,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isLogout ? Colors.red.shade600 : (isSelected ? Colors.teal.shade700 : Colors.grey.shade800),
          ),
        ),
        onTap: () {
          if (isLogout) {
            Navigator.pushReplacementNamed(context, '/login');
          } else if (title == 'Dashboard') {
            Navigator.pop(context);
          }
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        dense: true,
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal.shade600, Colors.teal.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.shade200.withOpacity(0.5),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good Morning,',
                  style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Dr. John Doe',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '8 appointments today',
                    style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.medical_services_rounded, color: Colors.white, size: 40),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCards() {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildStatCard('Total Patients', '1,247', Icons.people_rounded, Colors.blue.shade600, Colors.blue.shade50),
          _buildStatCard('This Week', '42', Icons.person_add_rounded, Colors.green.shade600, Colors.green.shade50),
          _buildStatCard('Pending', '18', Icons.pending_actions_rounded, Colors.orange.shade600, Colors.orange.shade50),
          _buildStatCard('Completed', '156', Icons.check_circle_rounded, Colors.purple.shade600, Colors.purple.shade50),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color iconColor, Color bgColor) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  label,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor, size: 18),
              ),
            ],
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.15,
      children: [
        _buildActionCard('New Patient', Icons.person_add_rounded, Colors.blue.shade600, Colors.blue.shade50),
        _buildActionCard('Schedule', Icons.calendar_today_rounded, Colors.green.shade600, Colors.green.shade50),
        _buildActionCard('Prescriptions', Icons.note_add_rounded, Colors.orange.shade600, Colors.orange.shade50),
        _buildActionCard('Reports', Icons.description_rounded, Colors.purple.shade600, Colors.purple.shade50),
      ],
    );
  }

  Widget _buildActionCard(String title, IconData icon, Color iconColor, Color bgColor) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 28),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentActivity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Activity',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildActivityItem('Sarah Johnson', 'Appointment completed', '10 min ago', Colors.green.shade600),
              const Divider(height: 1),
              _buildActivityItem('Michael Chen', 'New prescription issued', '1 hour ago', Colors.blue.shade600),
              const Divider(height: 1),
              _buildActivityItem('Emily Davis', 'Lab results uploaded', '2 hours ago', Colors.orange.shade600),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActivityItem(String name, String action, String time, Color color) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.1),
        child: Icon(Icons.person_rounded, color: color, size: 24),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        action,
        style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        time,
        style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
      ),
    );
  }
}