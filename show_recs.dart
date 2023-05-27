import 'package:burchak_4/widgets/parallelogram_painter.dart';
import 'package:burchak_4/widgets/romb_draw.dart';
import 'package:flutter/material.dart';

class ShowRecs extends StatelessWidget {
  final double width;
  final double height;
  final int selectedCaty;
  ShowRecs({required this.width, required this.height, required this.selectedCaty});

  @override
  Widget build(BuildContext context) {
    print(selectedCaty);
    return selectedCaty == 0 || selectedCaty == 1
     ? Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(selectedCaty == 1 ? 'b = ${height.toString()}' : '',  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
        Column(
          children: [
            Text('a = ${width.toString()}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
            Center(
              child: Container(
                width: width > 270 ? 270 : width,
                height: selectedCaty == 0 ? width > 270 ? 270 : width : height > 270 ? 270 : height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 3),
                ),
              ),
            ),
          ],
        )
      ],
    ) : selectedCaty == 2 ? Column(
      children: [
        Text('a = ${width.toString()}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
        Text('b = ${height.toString()}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
        Center(child: ParallelogramContainer(width: width, height: height,),)
      ],
    )
    : selectedCaty == 3 ? Column(
      children: [
        Text('a = ${width.toString()}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
        Text('b = ${height.toString()}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
        RhombusContainer(width: width, height: height,)
      ],
    ) : Container();
  }
}
