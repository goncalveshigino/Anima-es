
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
      this.secundColor = Colors.grey
    }
  );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SliderModel(),
      child: SafeArea(
          child: Center(
          child: Builder(
            builder: (BuildContext context){

             Provider.of<_SliderModel>(context)._primaryColor = this.primaryColor;
             Provider.of<_SliderModel>(context)._secundColor = this.secundColor;
              return  _CrearEstructuraSlideshow(pontosAcima: pontosAcima, slides: slides);
            },
          ),
        ),
      ),
    );
  }
}

class _CrearEstructuraSlideshow extends StatelessWidget {
  const _CrearEstructuraSlideshow({
  
    @required this.pontosAcima,
    @required this.slides,
  });

  final bool pontosAcima;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if( this.pontosAcima) 
            _Dots( this.slides.length),



        Expanded(
          child: _Slides( this.slides),
        ),

         if( !this.pontosAcima) 
            _Dots( this.slides.length),
      ],
    );
  }
}


class _Dots extends StatelessWidget {

 final int totalslides;


_Dots(this.totalslides);

  @override
  Widget build(BuildContext context) {
    return Container(
       width: double.infinity,
       height: 80,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(this.totalslides, (i) => _Dot(i)),
       ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;
 

  const _Dot( this.index, );

  @override
  Widget build(BuildContext context) {

  final ssModel = Provider.of<_SliderModel>(context);

    return AnimatedContainer(
      duration: Duration( milliseconds: 200),
        child: Container(
        height: 12,
        width: 12,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: ( ssModel._currentPage >= index - 0.5 &&  ssModel._currentPage < index + 0.5) 
                  ? ssModel._primaryColor : ssModel._secundColor,
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
       Provider.of<_SliderModel>(context, listen: false).currentPage = pageViewController.page;

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


class _SliderModel extends ChangeNotifier{

  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secundColor = Colors.grey;


  double get currentPage  => this._currentPage;
  set currentPage( double pagina){
    this._currentPage = pagina;
    notifyListeners();
  }

  Color get primaryColor => this._primaryColor;
  set primaryColor( Color color) {
    this._primaryColor =  color;
    notifyListeners();
  }

  Color get secundColor => this._secundColor;
  set secundColor( Color color) {
    this._secundColor = color;
    notifyListeners();
  }

}
