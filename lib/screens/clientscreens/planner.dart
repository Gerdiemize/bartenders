import 'package:bartenders_and_more/widgets/clientside/dashboardwidgetsclient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlannerScreen extends StatefulWidget {
  @override
  _PlannerScreenState createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 0;

  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        selectedIndex = _tabController.index;
      });
      print("Selected Index: " + _tabController.index.toString());
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Planner'),
        backgroundColor: Colors.black,
        bottom: TabBar(
          controller: _tabController,
          indicator: GradientTabIndicator(
            gradient: LinearGradient(
              colors: [Color(0xFF825B33), Color(0xFFE8DABF),Color(0xFF825B33)], // Adjust gradient colors here
            ),
          ),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          tabs: [
            GradientTab(text: 'Current Events', index: 0, selectedIndex: selectedIndex),
            GradientTab(text: 'Previous Events', index: 1, selectedIndex: selectedIndex),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            itemCount: 10, // Replace with your actual data length
            itemBuilder: (BuildContext context, int index) {
              return EventPlannerCard(); // Replace with your event card data
            },
          ),
          ListView.builder(
            itemCount: 10, // Replace with your actual data length
            itemBuilder: (BuildContext context, int index) {
              return EventPlannerCard(); // Replace with your event card data
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_list),
            label: 'Planner',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class GradientTab extends StatefulWidget {
  final String text;
  final int index;
  final int selectedIndex;

  GradientTab({required this.text, required this.index, required this.selectedIndex});

  @override
  _GradientTabState createState() => _GradientTabState();
}

class _GradientTabState extends State<GradientTab> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.selectedIndex == widget.index;
    print('Tab selection: ${widget.selectedIndex}');
    return Tab(
      child: ShaderMask(
        shaderCallback: (bounds) => isSelected
            ? LinearGradient(
                colors: [Color(0xFF825B33), Color(0xFFE8DABF),Color(0xFF825B33)], // Adjust gradient colors here
              ).createShader(bounds)
            : LinearGradient(
                colors: [Colors.grey, Colors.grey],
              ).createShader(bounds),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class GradientTabIndicator extends Decoration {
  final Gradient gradient;

  GradientTabIndicator({required this.gradient});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _GradientPainter(this, onChanged, gradient: gradient);
  }
}

class _GradientPainter extends BoxPainter {
  final GradientTabIndicator decoration;
  final Gradient gradient;

  _GradientPainter(this.decoration, VoidCallback? onChanged, {required this.gradient})
      : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = Offset(offset.dx, configuration.size!.height - 2) & Size(configuration.size!.width, 2);
    Paint paint = Paint()..shader = gradient.createShader(rect);
    canvas.drawRect(rect, paint);
  }
}



             

             
