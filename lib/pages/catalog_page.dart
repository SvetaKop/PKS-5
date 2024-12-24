import 'package:flutter/material.dart';
import 'package:hello_app/model/note.dart';
import 'package:provider/provider.dart';
import 'package:hello_app/model/favorites.dart';
import 'package:hello_app/pages/add_note_page.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
   _CatalogPageState createState() => _CatalogPageState();
   }

   class _CatalogPageState extends State<CatalogPage> {
     final List<Tea> teas = <Tea>[
       Tea(id: 1,
          name: 'Черная смородина',
         image: 'https://main-cdn.sbermegamarket.ru/big2/hlr-system/-53/187/341/930/623/100059988726b0.jpg',
         description: 'Смесь цейлонского и индийского чёрного чая с добавлением листа и ягод чёрной смородины',
         price: 'Цена: 450 руб/100 г'),
      Tea(id: 2,
          name: 'Молочный улун',
          image: 'https://cdn1.ozone.ru/s3/multimedia-1-h/7025810489.jpg',
          description: 'Китайский улун с карамельным ароматом и сливочными оттенками во вкусе',
          price: 'Цена: 420 руб/100 г'),
       Tea(id: 3,
          name: 'Цейлон рухуна',
         image: 'https://cdn.100sp.ru/pictures/103638444',
         description: 'Чай из южной части Шри-Ланки с цветочным ароматом и насыщенным вкусом с нотами ириса, дерева и мёда',
         price: 'Цена: 360 руб/100 г'),
       Tea(id: 4,
          name: 'Ганпаудер',
         image: 'https://bergamotik.ru/upload/iblock/b26/b26418c08e1aa21075f2dfcee2a87dc2.jpg',
         description: 'Классический насыщенный зелёный чай из Китая, скрученный в шарики',
         price: 'Цена: 270 руб/100 г'),
       Tea(id: 5,
          name: 'Тегуаньинь',
         image: 'https://avatars.mds.yandex.net/get-mpic/11764182/2a0000018afe58653142943baef9c142fa4c/orig',
         description: 'Популярный китайский улун со свежим цветочным ароматом и насыщенным глубоким вкусом с нотами орхидеи и ириса',
         price: 'Цена: 450 руб/100 г'),
       Tea(id: 6,
          name: 'Гречишный',
         image: 'https://8gramm.ru/wa-data/public/shop/products/28/31/3128/images/4683/4683.970.jpg',
         description: 'Тизан с лёгким сладковатым ароматом, с оттенками ореха и овсяного печенья',
         price: 'Цена: 380 руб/100 г'),
       Tea(id: 7,
          name: 'Липовый',
         image: 'https://xn--e1aaalojbdrrfdi7p.xn--p1ai/upload/iblock/55f/55fa7b9b088ce9312c74e428319c5814.JPG',
         description: 'Китайская сенча с лимонной травой, листьями липы, цедрой лимона, ромашкой и вербеной',
         price: 'Цена: 400 руб/100 г'),
       Tea(id: 8,
          name: 'Вишневый',
         image: 'https://cdn1.ozone.ru/multimedia/1037475173.jpg',
         description: 'Индийский чёрный чай с кусочками вишни, корицей и вишнёвым листом',
         price: 'Цена: 500 руб/100 г'),
       Tea(id: 9,
          name: 'Барбарисовый',
         image: 'https://avatars.mds.yandex.net/get-mpic/5290046/img_id1883767293663323622.jpeg/orig',
         description: 'Смесь цейлонского и индийского чёрного чая с ягодами барбариса и клубники, кусочками ананаса и папайи, лепестками розы, календулы и василька',
         price: 'Цена: 420 руб/100 г'),
       Tea(id: 10,
          name: 'Маласа',
         image: 'https://lavka.demomax.ru/upload/iblock/204/2042b818e0969b0ee95e563f250b0955.jpg',
         description: 'Смесь чёрного цейлонского и индийского чая с корицей, анисом, фенхелем, имбирём, гвоздикой и чёрным перцем',
         price: 'Цена: 400 руб/100 г'),
     ];

   void _addNewTea(Tea tea) {
    setState(() {
      teas.add(tea);
    });
   }

   @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 0.75,
          ),
          itemCount: teas.length,
          itemBuilder: (context, index) {
            var tea;
            return TeaCard(tea: teas[index]);
            },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTea = await Navigator.push<Tea>(
            context,
            MaterialPageRoute(builder: (context) => const AddNotePage()),
          );
          if (newTea != null) {
            _addNewTea(newTea);
          }
        },
        child: const Icon(Icons.add),
        tooltip: 'Добавить новый товар',
      ),
    );
   }
}

class TeaCard extends StatelessWidget {
  final Tea tea;

  const TeaCard({Key? key, required this.tea}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favorites = context.watch<FavoritesModel>();
    bool isFavorite = favorites.favoriteItemIds.contains(tea.id);

    return Card(
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.network(
              tea.image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              tea.name,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              tea.price,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.purple,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.pink : null,
            ),
            onPressed: () {
              if (isFavorite) {
                favorites.remove(tea.id);
              } else {
                favorites.add(tea.id);
              }
            },
          ),
        ],
      ),
    );
  }
}