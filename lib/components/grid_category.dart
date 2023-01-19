import 'package:flutter/material.dart';

class GridCategory extends StatelessWidget {
  final GridItem item;
  const GridCategory({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: item.getPage)),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.5,color: Colors.grey[200]!)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item.icon,color: item.color,size: 36,),
            const SizedBox(height: 2,),
            Text(item.title,style: const TextStyle(fontSize: 12),),
          ],
        ),
      ),
    );
  }
}

class GridItem {
  String title;
  IconData icon;
  Widget Function(BuildContext context) getPage;
  MaterialColor color;

  GridItem({
    required this.title,
    required this.icon,
    required this.getPage,
    required this.color,
  });
}
