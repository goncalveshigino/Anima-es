import 'package:animacoes/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
        child: Scaffold(
        body: Center(
          child: Column(
            children: [
            Expanded(
              child: _Slides(),
            ),
             _Dots()
            ],
          ),
        ),
      ),
    );
  }
}



class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       width: double.infinity,
       height: 80,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Dot(0),
            _Dot(1),
            _Dot(2)
          
          ],
       ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;

  const _Dot( this.index);

  @override
  Widget build(BuildContext context) {

  final pageViewIdex = Provider.of<SliderModel>(context).currentPage;

    return Container(
      height: 12,
      width: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: ( pageViewIdex == index ) ? Colors.red : Colors.grey,
        shape: BoxShape.circle
      ),
    );
  }
}


class _Slides extends StatefulWidget {

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

 
 final pageViewController = new PageController();

 @override
  void initState() {

    super.initState();

    pageViewController.addListener(() {
      

       //Usar p provider para atualizar 
       Provider.of<SliderModel>(context, listen: false).currentPage = pageViewController.page;

    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: [

          _Slide('assets/images/slide-1.svg'),
          _Slide('assets/images/slide-2.svg'),
          _Slide('assets/images/slide-3.svg'),
     
        ],
      ),
    );
  }
}


class _Slide extends StatelessWidget {
   
   final String svg;

  const _Slide(this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: SvgPicture.asset(svg),
    );
  }
}
