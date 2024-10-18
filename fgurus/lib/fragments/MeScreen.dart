import 'package:fgurus/fragments/NotificationsScreen.dart';
import 'package:flutter/material.dart';

class MeScreen extends StatelessWidget {
  const MeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 130.0,
                floating: false,
                pinned: true,
                stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    collapseMode: CollapseMode.parallax,
                    title: const _TopPortion(),
                    background: Image.network("../../assets/players.jpg",
                        fit: BoxFit.cover,
                        color: const Color.fromRGBO(255, 255, 255, 0.3),
                        colorBlendMode: BlendMode.modulate)),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  const TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: Colors.amber,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                          icon: Icon(Icons.notification_add_outlined),
                          text: 'Notifications'),
                      Tab(icon: Icon(Icons.favorite), text: 'Favorites'),
                      Tab(icon: Icon(Icons.bookmark), text: 'Bookmarks'),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: const TabBarView(
            children: [
              // Content for the first tab
              Center(child: NotificationsScreen()),
              // Content for the second tab
              Center(child: Text('Favorites')),
              // Content for the third tab
              Center(child: Text('Bookmarks')),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return _tabBar;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class _TopPortion extends StatelessWidget {
  const _TopPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: 60,
        height: 60,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('../../assets/teams.jpg')),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 7,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                child: Container(
                  margin: const EdgeInsets.all(4.0),
                  decoration: const BoxDecoration(
                      color: Colors.green, shape: BoxShape.circle),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
