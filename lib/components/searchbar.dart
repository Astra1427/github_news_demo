import 'package:flutter/cupertino.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 60,
      child: CupertinoTextField(
        prefix: Padding(
          padding: EdgeInsets.fromLTRB(9, 6, 9, 6),
          child: Icon(CupertinoIcons.search,color: CupertinoColors.systemGrey,),
        ),
      ),
    );
  }
}


class SearchBarDelegate extends SliverPersistentHeaderDelegate{
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SearchBar();
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(SearchBarDelegate oldDelegate) {
    return false;
  }

}