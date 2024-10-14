import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  
  static const name = 'infinite_screen';
  
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imagesIds = [1,2,3,4,5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener((){
      if((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent){
        loadNextPage();
      }

    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted  = false; // se llama cuando el componente esta o va hacer destruido
    super.dispose();
  }

  Future loadNextPage() async{
    
    if( isLoading) return;
      isLoading =true;
      setState(() {});

      await Future.delayed(const Duration(seconds: 2));

      addFivesImages();
      isLoading = false;

      if( !isMounted) return; ///si no esta montado no hace nada


      setState(() { });
      moveScrollToBottom();
    
  }

  Future<void> onRefresh() async{
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));

    if(!isMounted)return;

    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId +1);
    addFivesImages();
    setState(() {});

  }

  //cuando este cerca del final carga la imagen
  void moveScrollToBottom(){
    if((scrollController.position.pixels + 130) <= scrollController.position.maxScrollExtent){
      scrollController.animateTo(
        scrollController.position.pixels + 120,
        duration: const Duration(microseconds: 300), 
        curve: Curves.fastOutSlowIn
      );
      
    }
  }


  void addFivesImages(){
    final lastId = imagesIds.last;
    
    imagesIds.add(lastId + 1);
    imagesIds.add(lastId + 2);
    imagesIds.add(lastId + 3);
    imagesIds.add(lastId + 4);
    imagesIds.add(lastId + 5);

    //imagesIds.addAll(
    //  [1,2,3,4,5].map((e) => lastId + e)
    //); //es lo mismo que lo de arriba pero con menos lineas de codigo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          edgeOffset: 10,
          strokeWidth: 3,
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index){
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage('https://picsum.photos/id/${ imagesIds[index] }/500/300'),           
              );
                //image: image)
            }
          ),
        ),
      ),
    
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> context.pop(),
        child: !isLoading ? 
          const Icon(Icons.arrow_back_ios_new_rounded) :
          SpinPerfect(
            infinite: true,
            child: FadeIn(child: const Icon(Icons.refresh_rounded))
          ),
      )
    );

    
  }
}