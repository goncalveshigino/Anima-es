import 'package:animacoes/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {

  final List<Widget> slides;
  final bool pontosAcima;
  final Color primaryColor;
  final Color secundColor;

  Slideshow(
    { 
      @required this.slides,
      this.pontosAcima = false,
      this.primaryColor = Colors.purple,
      this.secundColor = Colors.white
    }
  );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: SafeArea(
          child: Center(
          child: Column(
            children: [
              if( this.pontosAcima) 
                  _Dots( this.slides.length, this.primaryColor, this.secundColor),



              Expanded(
                child: _Slides( this.slides),
              ),

               if( !this.pontosAcima) 
                  _Dots( this.slides.length, this.primaryColor, this.secundColor),
            ],
          ),
        ),
      ),
    );
  }
}


class _Dots extends StatelessWidget {

 final int totalslides;
 final Color primaryColor;
 final Color secundColor;

_Dots(this.totalslides, this.primaryColor,this.secundColor);

  @override
  Widget build(BuildContext context) {
    return Container(
       width: double.infinity,
       height: 80,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.center,

          children: List.generate(this.totalslides, (i) => _Dot(i, this.primaryColor, this.secundColor)),
       ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;
  final Color primaryColor;
  final Color secundColor;

  const _Dot( this.index, this.primaryColor, this.secundColor);

  @override
  Widget build(BuildContext context) {

  final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: Duration( milliseconds: 200),
        child: Container(
        height: 12,
        width: 12,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: ( pageViewIndex >= index - 0.5 &&  pageViewIndex < index + 0.5) ? primaryColor : secundColor,
          shape: BoxShape.circle
        ),
      ),
    );
  }
}


class _Slides extends StatefulWidget {

  final List<Widget> slides;

  _Slides(this.slides);

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
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}


class _Slide extends StatelessWidget {
   
   final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}
