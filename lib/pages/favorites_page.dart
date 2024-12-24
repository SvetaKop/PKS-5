import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hello_app/model/favorites.dart';

class FavoritesPage extends StatelessWidget {
   FavoritesPage({super.key});

  final List<Map<String, String>> teas = [
    {
      'id': '1',
      'name': 'Черная смородина',
      'image': 'https://main-cdn.sbermegamarket.ru/big2/hlr-system/-53/187/341/930/623/100059988726b0.jpg'
    },
    {
      'id': '2',
      'name': 'Молочный улун',
      'image': 'https://cdn1.ozone.ru/s3/multimedia-1-h/7025810489.jpg'
    },
    {
      'id': '3',
      'name': 'Цейлон рухуна',
      'image': 'https://cdn.100sp.ru/pictures/103638444'
    },
    {
      'id': '4',
      'name': 'Ганпаудер',
      'image': 'https://bergamotik.ru/upload/iblock/b26/b26418c08e1aa21075f2dfcee2a87dc2.jpg'
    },
    {
      'id': '5',
      'name': 'Тегуаньинь',
      'image': 'https://avatars.mds.yandex.net/get-mpic/11764182/2a0000018afe58653142943baef9c142fa4c/orig'
    },
    {
      'id': '6',
      'name': 'Гречишный',
      'image': 'https://8gramm.ru/wa-data/public/shop/products/28/31/3128/images/4683/4683.970.jpg'
    },
    {
      'id': '7',
      'name': 'Липовый',
      'image': 'https://xn--e1aaalojbdrrfdi7p.xn--p1ai/upload/iblock/55f/55fa7b9b088ce9312c74e428319c5814.JPG'
    },
    {
      'id': '8',
      'name': 'Вишневый',
      'image': 'https://cdn1.ozone.ru/multimedia/1037475173.jpg'
    },
    {
      'id': '9',
      'name': 'Барбарисовый',
      'image': 'https://avatars.mds.yandex.net/get-mpic/5290046/img_id1883767293663323622.jpeg/orig'
    },
    {
      'id': '10',
      'name': 'Маласа',
      'image': 'https://lavka.demomax.ru/upload/iblock/204/2042b818e0969b0ee95e563f250b0955.jpg'
    },
  ];

   @override
   Widget build(BuildContext context) {
     var favorites = context.watch<FavoritesModel>();
     var favoriteTeas = teas.where((tea) {
       var id = int.tryParse(tea['id'] ?? '');
       return id != null && favorites.favoriteItemIds.contains(id);
     }).toList();

     return Scaffold(
       body: favoriteTeas.isNotEmpty
           ? ListView.builder(
         itemCount: favoriteTeas.length,
         itemBuilder: (context, index) {
           var tea = favoriteTeas[index];
           return ListTile(
             leading: Image.network(
               tea['image']!,
               width: 50,
               height: 50,
               fit: BoxFit.cover,
             ),
             title: Text(tea['name']!),
             trailing: IconButton(
               icon: const Icon(Icons.favorite),
               color: Colors.pink,
               onPressed: () {
                 var id = int.tryParse(tea['id'] ?? '');
                 if (id != null) {
                   favorites.remove(id);
                 }
               },
             ),
           );
         },
       )
           : const Center(
         child: Text('Нет избранных товаров'),
       ),
     );
   }
}