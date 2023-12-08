import 'package:flutter/material.dart';
import 'package:ko_ok/controllers/authentication_controller.dart';
import 'package:ko_ok/controllers/challenge_controller.dart';
import 'package:ko_ok/controllers/theme_controller.dart';
import 'package:ko_ok/views/screens/login_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
       appBar: AppBar(
        title:const Text('accueil',style: TextStyle(color: Colors.black),),
        leading: IconButton(icon:const Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed: (){Navigator.of(context).pop();},),
        centerTitle: true,
        flexibleSpace: Image(
          image: AssetImage('assets/${Provider.of<ThemeController>(context).theme.appBarImage}'),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed: ()async{ await Provider.of<AuthController>(context,listen: false).logout().then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>LoginScreen())));}, icon:const Icon(Icons.logout_outlined,color: Colors.black,)),
PopupMenuButton(
  icon: Icon(Icons.more_vert_sharp,color: Colors.black,),
  color: Colors.white,
  onSelected: (value) async{
            Provider.of<ThemeController>(context,listen: false).setTheme(value);
            await Provider.of<ThemeController>(context,listen: false).saveTheme(value);

          }, itemBuilder: (BuildContext bc) {
            return  [
              PopupMenuItem(
                value: 'chte',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/flocon-de-neige.png',width: 20,height: 20,),
                    const Text("Hiver"),
                  ],
                ),
              ),
              PopupMenuItem(
                value: '5rif',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/tulipe.png',width: 20,height: 20,),
                    const Text("printemps"),
                  ],
                ),
              ),
               PopupMenuItem(
                value: 'sif',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/soleil.png',width: 20,height: 20,),
                    const Text("été"),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'rbi3',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/sans-feuilles.png',width: 20,height: 20,),
                    const Text("automne"),
                  ],
                ),
              ),
            ];
          })
          
        ],
      ),
      body: Stack(children: [Image.asset('assets/${Provider.of<ThemeController>(context).theme.backgroundImage}',fit: BoxFit.cover,width: double.infinity,height: double.infinity,),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: Provider.of<ChallengeController>(context,listen: false).challengesList.length,
          itemBuilder: (ctx,index)=>Container(
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(172, 136, 192, 87), 
            ) ,
            child: ListTile(
            leading: CircleAvatar(backgroundColor: Colors.grey,),
              title:Text(Provider.of<ChallengeController>(context,listen: false).challengesList[index].name) ,
              subtitle:Text(Provider.of<ChallengeController>(context,listen: false).challengesList[index].description),
                ),
          )),
      )
      ],),
    )
    );
  }
}