

import 'package:demo/pages/thirth_page.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  //String dollar_sign="\$";
  int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          physics:const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height*0.2,
              pinned: true,
              //floating: true,
              leading: Container(
                width: 20,
                height: 20,
                child: Image.asset("asset/logo.png"),
              ),
              actions: [
                IconButton(onPressed: (){}, icon:const Icon(Icons.document_scanner_sharp,color: Colors.white,)),
                IconButton(onPressed: (){}, icon:const Icon(Icons.notifications_none,color: Colors.white,))
              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const[
                    Text("\$9,479.25"),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text("Balance Available",style: TextStyle(fontSize: 8),),
                    )
                  ],
                ),
                ),
                ),
            SliverList(delegate: SliverChildListDelegate([
              GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  mainAxisSpacing:0.4,
                  crossAxisCount: 4,
                  children: [
                    _buildMenu(Icons.telegram, "Send"),
                   _buildMenu(Icons.upcoming_outlined, "Request"),
                   _buildMenu(Icons.drive_folder_upload, "Transfer"),
                    _buildMenu(Icons.note_add_rounded, "Create"),

                   _buildMenu(Icons.sticky_note_2_rounded, "Send a Message"),
                   _buildMenu(Icons.payment_outlined, "Pay Bills"),
                    _buildMenu(Icons.splitscreen_rounded, "Splite the"),
                    _buildMenu(Icons.group, "Share Contact"),
                ],
              ),
              const Padding(
                padding:EdgeInsets.only(left: 15,right: 15),
                child: Divider(
                    thickness: 1,
                ),
              ),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  ListTile(
                    title:const Text("Recently Activity",style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),),
                    trailing: IconButton(icon: Icon(Icons.keyboard_tab,color: Colors.blue,),
                      onPressed: (){
                      print("new page");
                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ThirdthPage()));
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>ThirdthPage()));
                    },),
                  ),
                  _listTile("Leslie Alexander", "Preapproved Payment - Completed", "+ \$129.5",Colors.green),
                  _listTile("Sovannah Nguyen", "Transfer Bank - Completed", "- \$47.5",Colors.red),
                  _listTile("Cameron Williamson", "Preapproved Payment - Completed", "+ \$86.5",Colors.green),
                  _listTile("Dianne Russell", "Transfer Bank - Completed", " - \$66.5",Colors.red),
                  _listTile("Dianne Russell", "Transfer Bank - Completed", " - \$66.5",Colors.red),
                  _listTile("Dianne Russell", "Transfer Bank - Completed", " - \$66.5",Colors.red),
                  _listTile("Dianne Russell", "Transfer Bank - Completed", " - \$66.5",Colors.red),

                ],
              ),
            ]))
          ],
        ),
 //BOTTOM NAVIGATION BAR
        bottomNavigationBar: BottomNavigationBar(
         //backgroundColor:Colors.red,
          elevation: 10,

          onTap: ( int index){
            setState((){
              _selectedIndex=index;
            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex:_selectedIndex ,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.black.withOpacity(0.5),
          unselectedLabelStyle: TextStyle(color: Colors.black),
          items:const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,)
              ,label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_activity_outlined),
              label: 'Activity',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.analytics),label: "Analytics"),
            BottomNavigationBarItem(icon: Icon(Icons.note_alt_rounded),label: "Invoicing"),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz_rounded),label: "More")
          ],
        ),
    );
  }

   _buildMenu(IconData icon,String title){
    return  Container(
      //alignment: Alignment.center,
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width:60,
            height: 60,
            child: Icon(icon,color: Colors.blue,size: 32,),
            decoration: BoxDecoration(
                color: Colors.black12.withOpacity(0.05),
                borderRadius: BorderRadius.circular(50)
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(title,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                ),
                softWrap: false,
                overflow: TextOverflow.ellipsis),
          )
        ],
      ),
    );
  }

    _listTile(String title,String subtitle,String price,Color color){
    return ListTile(
        title: Text(title,style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16
        ),),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(subtitle),
        ),
        trailing: Text(price,style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.bold
        ),)
    );
    }

//CREATE ROUTE

}
