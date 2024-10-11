import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/menu/menu_items.dart';
import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';
import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';

class HomeScreen extends StatelessWidget {

  static const String name = 'home_screen' ;

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + material 3'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index ){
        final menuItem = appMenuItems[index];
        return _CustomListTitle(menuItem: menuItem);
      }
    );
  }
}

class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({
    required this.menuItem,
  });

  final MenuItems menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary), //leading icono o widget que colocamos antes de...
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary,), //trailing wifget al final de la fila
      title: Text(menuItem.tittle),
      subtitle: Text(menuItem.tittle),
      onTap: (){

        context.push(menuItem.link);
        //context.pushNamed(CardsScreen.name);

        //Navigator.pushNamed(context, menuItem.link);
        /*Navigator.of(context).push(
          MaterialPageRoute(
          builder: (context) => const ButtonsScreen(),
          
          ),
        );*/
        
        
      },
    );
  }
}