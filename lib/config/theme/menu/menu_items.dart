import 'package:flutter/material.dart';

class MenuItems {
  final String tittle;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItems(
    {required this.tittle, 
    required this.subTitle, 
    required this.link, 
    required this.icon});
}

 const List<MenuItems> appMenuItems = [
    MenuItems(
      tittle: 'Botones', 
      subTitle: 'Varios botones en Flutter', 
      link: '/buttons', 
      icon: Icons.smart_button_outlined
    ),

    MenuItems(
      tittle: 'Tarjetas', 
      subTitle: 'Contenedor tuneado', 
      link: '/cards', 
      icon: Icons.credit_card
    ),

    MenuItems(
      tittle: 'Progress Indicators', 
      subTitle: 'Generales y Controlados', 
      link: '/progress', 
      icon: Icons.refresh_rounded
    ),

    MenuItems(
      tittle: 'Snackbar y dialogos', 
      subTitle: 'Indicadores en pantalla', 
      link: '/snackbar', 
      icon: Icons.info_outline_rounded
    ),

    MenuItems(
      tittle: 'Animated Container', 
      subTitle: 'Stateful wifget animado', 
      link: '/animated', 
      icon: Icons.check_box_outline_blank_rounded
    )

 ];