
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {

  final List<Widget> slides;
  final bool pontosAcima;
  final Color primaryColor;
  final Color secundColor;
  final double bulletPrimario;
  final double bulletSecundario;

  Slideshow(
    { 
      @required this.slides,
      this.pontosAcima      = false,
      this.primaryColor     = Colors.white,
      this.secundColor      = Colors.grey,
      this.bulletPrimario   = 12.0,
      this.bulletSecundario = 12.0
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

            Provider.of<_SliderModel>(context)._bulletPrimario = this.bulletPrimario;
            Provider.of<_SliderModel>(context)._bulletSecundario = this.bulletSecundario;
            
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

  double tamanho;
  Color color;
  
  if( ssModel._currentPage >= index - 0.5 &&  ssModel._currentPage < index + 0.5){
     
    tamanho = ssModel.bulletPrimario;
    color = ssModel.primaryColor;
             
  } else {
    tamanho = ssModel.bulletSecundario;
    color = ssModel.secundColor;
  }


    return AnimatedContainer(
      duration: Duration( milliseconds: 200),
        child: Container(
        height: tamanho,
        width: tamanho,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: color,
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

  double _currentPage     = 0;
  Color _primaryColor     = Colors.blue;
  Color _secundColor      = Colors.grey;
  double _bulletPrimario   = 12.0;
  double _bulletSecundario = 12.0;


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

  double get bulletPrimario => this._bulletPrimario;
  set bulletPrimario( double tamanho){
    this._bulletPrimario = tamanho;
    notifyListeners();
  }

  double get bulletSecundario => this._bulletSecundario;
  set bulletSecundario( double tamanho){
    this._bulletSecundario = tamanho;
    notifyListeners();
  }

}
