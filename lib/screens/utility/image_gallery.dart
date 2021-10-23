import 'package:flutter/material.dart';

class ImageGallery extends StatefulWidget {
  const ImageGallery({Key? key}) : super(key: key);

  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 600,
      child: Center(
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            ...List.generate(
              9,
              (index) => SlantImage(
                filepath: 'assets/images/mission${index + 1}.webp',
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SlantImage extends StatefulWidget {
  const SlantImage({Key? key, required this.filepath}) : super(key: key);
  final String filepath;
  @override
  _SlantImageState createState() => _SlantImageState();
}

class _SlantImageState extends State<SlantImage> {
  double width = 120;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) {
        setState(() {
          width = 300;
        });
      },
      onExit: (e) {
        setState(() {
          width = 120;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: ClipPath(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 70,
            width: width,
            child: Image.asset(
              widget.filepath,
              fit: BoxFit.cover,
            ),
          ),
          clipper: BottomWaveClipper(),
        ),
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height - 30);
    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, 30);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
