import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SnackbarScreen extends StatelessWidget {
  
  static const name = 'snackbar_screen';
  
  const SnackbarScreen({super.key});

  void showCustomSnackbar (BuildContext context){

    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: const Text('hola mudno'),
      action: SnackBarAction(label: 'ok!!', onPressed: (){},   
      ),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);

  }

  void openDialog (BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false, //obliga a escocger una de las opciones si  no no se cierra el dialogo
      builder: (context) => AlertDialog(
        title: const Text('¿Estas seguro?'),
        content: const Text('Laborum ad nisi nostrud magna ex. Dolore officia anim deserunt dolor labore dolor officia nisi dolore elit nostrud irure id do. Incididunt veniam aliqua do veniam. Esse voluptate occaecat eiusmod ipsum sit qui mollit id. Proident enim nulla reprehenderit officia voluptate fugiat Lorem cillum adipisicing ea id dolore. Duis sint dolor nisi aliqua minim culpa ad elit sunt cillum aute ullamco ipsum.'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar'))
        ],
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogos'),
      ),

      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Qui nisi esse excepteur sunt anim pariatur consectetur amet sint et nostrud magna. Mollit eiusmod id nostrud Lorem velit occaecat quis proident duis laborum. Aute sint culpa dolor sunt excepteur sit ea id est anim sit exercitation magna sit. Occaecat exercitation aliqua enim nulla aute. Deserunt ipsum pariatur esse nisi nulla occaecat in labore irure nostrud. Adipisicing Lorem quis eu excepteur cupidatat ut ex magna velit elit sint.')
                  ],
                );
              }, 
              child: const Text('Licencias usadas')
            ),

            FilledButton.tonal(
              onPressed: () => openDialog(context), 
              child: const Text('Mostrar dialogos')
            )

          ],
        ),
      ) ,

      floatingActionButton:  FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}