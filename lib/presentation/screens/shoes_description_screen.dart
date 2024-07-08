import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';

import '../providers/providers.dart';
import '../widgets/widget.dart';

class ShoesDescriptionScreen extends StatelessWidget {
  const ShoesDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                const Hero(
                  tag: 'shoes-1',
                  child: ShoesSizePreview(isFullScreen: true),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.chevron_left,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 25),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const ShoesDescription(
                      title: 'Nike Air Max 720',
                      description:
                          "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                    ),
                    _AddToCart(),
                    _ColorList(),
                    _MenuShoesSettings(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MenuShoesSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const _MenuSettingItem(
            icon: Icons.star,
            color: Colors.red,
            size: 25,
          ),
          _MenuSettingItem(
            icon: Icons.add_shopping_cart,
            color: Colors.grey.shade400,
            size: 25,
          ),
          _MenuSettingItem(
            icon: Icons.settings,
            color: Colors.grey.shade400,
            size: 25,
          ),
        ],
      ),
    );
  }
}

class _MenuSettingItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;

  const _MenuSettingItem({
    required this.icon,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 90,
      width: 90,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(0, 5),
            spreadRadius: -5,
          )
        ],
      ),
      child: Icon(icon, color: color, size: size),
    );
  }
}

class _AddToCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '\$180',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          CartButton(
            title: 'Buy now',
            height: 50,
            widht: 110,
          ),
        ],
      ),
    );
  }
}

class _ColorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: <Widget>[
          const Expanded(
              child: Stack(
            children: [
              Positioned(
                left: 90,
                child: _ColorItem(
                  color: Color(0xff364D56),
                  index: 1,
                  imagePath: 'assets/images/negro.png',
                ),
              ),
              Positioned(
                left: 60,
                child: _ColorItem(
                  color: Color(0xff2099f1),
                  index: 2,
                  imagePath: 'assets/images/azul.png',
                ),
              ),
              Positioned(
                left: 30,
                child: _ColorItem(
                  color: Color(0xffFFAD29),
                  index: 3,
                  imagePath: 'assets/images/amarillo.png',
                ),
              ),
              _ColorItem(
                color: Color(0xffC6D642),
                index: 4,
                imagePath: 'assets/images/verde.png',
              ),
            ],
          )),
          CartButton(
            title: 'More related items',
            height: 30,
            widht: 170,
            color: Colors.orange.shade200,
          )
        ],
      ),
    );
  }
}

class _ColorItem extends StatelessWidget {
  final Color color;
  final int index;
  final String imagePath;

  const _ColorItem({
    required this.color,
    required this.index,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final shoesProvider = context.watch<ShoesProvider>();

    return GestureDetector(
      onTap: () => shoesProvider.setAssetImage(imagePath),
      child: FadeInLeft(
        delay: Duration(milliseconds: index * 100),
        duration: const Duration(milliseconds: 200),
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}
