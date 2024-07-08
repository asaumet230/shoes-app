import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shoes_app/presentation/screens/screens.dart';
import '../providers/providers.dart';

class ShoesSizePreview extends StatelessWidget {
  final bool isFullScreen;

  const ShoesSizePreview({
    super.key,
    required this.isFullScreen,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isFullScreen) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ShoesDescriptionScreen(),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffFFCF53),
          borderRadius: !isFullScreen
              ? const BorderRadius.all(Radius.circular(40))
              : const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
        ),
        height: 400,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: isFullScreen ? 5 : 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _ShoesImage(),
            if (!isFullScreen) _ListSizes(),
          ],
        ),
      ),
    );
  }
}

class _ListSizes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _SizeItem(size: 7),
          _SizeItem(size: 7.5),
          _SizeItem(size: 8.0),
          _SizeItem(size: 8.5),
          _SizeItem(size: 9),
          _SizeItem(size: 9.5),
        ],
      ),
    );
  }
}

class _SizeItem extends StatelessWidget {
  final double size;

  const _SizeItem({required this.size});

  @override
  Widget build(BuildContext context) {
    final shoesProvider = context.watch<ShoesProvider>();

    return GestureDetector(
      onTap: () => shoesProvider.setSize(size),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: shoesProvider.getSize == size
              ? const Color(0xffF1A23A)
              : Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffF1A23A),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            size.toString().replaceAll('.0', ''),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: shoesProvider.getSize == size
                  ? Colors.white
                  : const Color(0xffFFCF53),
            ),
          ),
        ),
      ),
    );
  }
}

class _ShoesImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shoesProvider = context.watch<ShoesProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            right: 0,
            child: _ImageShadow(),
          ),
          Image.asset(shoesProvider.getAssetImage),
        ],
      ),
    );
  }
}

class _ImageShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: const <BoxShadow>[
            BoxShadow(color: Color(0xffEAA14E), blurRadius: 40),
          ],
        ),
      ),
    );
  }
}
