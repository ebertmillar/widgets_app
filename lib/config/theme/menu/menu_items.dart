import 'package:flutter/material.dart';

class MenuItems {
  final String tittle;
  final String subTittle;
  final String link;
  final IconData icon;

  const MenuItems(
    {required this.tittle, 
    required this.subTittle, 
    required this.link, 
    required this.icon});
}

 const List<MenuItems> appMenuItems = [
    MenuItems(
      tittle: 'Botones', 
      subTittle: 'VArios botones en Flutter', 
      link: '/buttons', 
      icon: Icons.smart_button_outlined
    ),

    MenuItems(
      tittle: 'Tarjetas', 
      subTittle: 'Contenedor tuneado', 
      link: '/cards', 
      icon: Icons.credit_card
    ),

    MenuItems(
      tittle: 'ProgressIndicatos', 
      subTittle: 'Generales y Controlados', 
      link: '/progress', 
      icon: Icons.refresh_rounded
    ),


 ];