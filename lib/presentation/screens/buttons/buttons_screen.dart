import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ButtonsScreen extends StatelessWidget {

  static const String name = 'buttons_screen' ;

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: (){
          context.pop();
        }
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){}, 
              child: const Text('Botón Elevado')
            ),
            const ElevatedButton(
              onPressed: null, 
              child: Text('Botón Desabilitado')
            ),
            ElevatedButton.icon(
              onPressed: (){}, 
              icon:const Icon(Icons.access_alarm_rounded) , 
              label: const Text('Icono Elevado')
            ),
            FilledButton(
              onPressed: (){}, 
              child: const Text('boton fondo solido')
            ),
            FilledButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.accessible_sharp),
              label: const Text('boton solido icono'),
            ),
            OutlinedButton(
              onPressed: (){}, 
              child: const Text('Outline')
            ),
            OutlinedButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.woo_commerce_rounded),
              label: const Text('Outline Icon')
            ),
            TextButton(
              onPressed: (){}, 
              child: const Text('texto')
            ),
            TextButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.person_search_outlined),
              label: const Text('text icon')
            ),

            //boton personalizado
            const CustomButton(),

            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.app_registration_rounded)
            ),  
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.app_registration_rounded),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary),
                iconColor: const WidgetStatePropertyAll(Colors.white)
              ),
            ),
          ],          
        ),
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    
    return ClipRRect(// Sirve para colocar especificamente bordes redondeados
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(// Es como un GestureDetector pero reacciona al metodo
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('hola mundo', style: TextStyle(color: Colors.white))
            ),
        ),
      ),
    );
  }
}