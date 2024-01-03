import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stress App'),
      ),
      body: const _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [

         _CustomListTile(
             title: 'Future Provider',
             subTitle: 'Mantener el estado de un future y su retorno',
             location: '/result'),

        _CustomListTile(
            title: 'Inicio de Sesión',
            subTitle: 'Porfavor inicia sesión para empezar',
            location: '/login'),    

        _CustomListTile(
            title: 'Registrate',
            subTitle: 'Porfavor registrate antes de empezar',
            location: '/register'),
        Image(
             image: NetworkImage('https://github.com/nayvilla/stress_app/blob/v2Registro/stress-removebg.png?raw=true'),
             fit: BoxFit.cover,
           ),          
      ],
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String location;

  const _CustomListTile({
    required this.title,
    required this.subTitle,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () => context.push(location),
    );
  }
}
