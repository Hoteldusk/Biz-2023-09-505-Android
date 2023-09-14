import './api/naver_open_api.dart';
import './models/naver_book_dto.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ViewBooksPage(),
    );
  }
}

class ViewBooksPage extends StatefulWidget {
  const ViewBooksPage({super.key});
  @override
  State<ViewBooksPage> createState() => _ViewBooksPageState();
}

class _ViewBooksPageState extends State<ViewBooksPage> {
  // Future<List<NaverBookDto>>
  Future<List<NaverBookDto>>? resultBooks = NaverOpenAPI().loadBooks();

  void searchBooks(search) {
    Future<List<NaverBookDto>>? searchResultBooks =
        NaverOpenAPI().loadBooks(search);

    setState(() {
      resultBooks = searchResultBooks;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("RESULT ${resultBooks == null}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SearchBox(searchBooks: searchBooks),
      ),
      body: ViewListPage(resultBooks: resultBooks),
    );
  }
}

class SearchBox extends StatelessWidget {
  SearchBox({
    super.key,
    required this.searchBooks,
  });
  final Function(String search) searchBooks;
  final searchInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          child: TextField(
            controller: searchInputController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            onSubmitted: (value) => searchBooks(value),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "검색어",
              hintText: "도서 검색어를 입력하세요",
            ),
          ),
        ),
      ],
    );
  }
}

class ViewListPage extends StatelessWidget {
  const ViewListPage({
    super.key,
    required this.resultBooks,
  });

  final Future<List<NaverBookDto>>? resultBooks;

  @override
  Widget build(BuildContext context) {
    // Future<List<Dto>> type 의 데이터들을 사용하여
    // 화면에 보여질 Widget을 생성하는 도구
    return SafeArea(
      child: FutureBuilder(
        future: resultBooks,
        // FutureBuilder 가 resultBooks 데이터를 사용하여 List 데이터로
        // 변환을 하고, 그 데이터를 다시 ListView.builder 에게 전달하여
        // 실제로 화면에 보여질 List를 생성한다
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            // ListView.builder 는 리스트의 각 항목(한개 데이터)들을
            // ListTile 에게 전달하여 한개 데이터를 표현할 View를 만들고
            // 그들을 모아서 리스트로 보여준다
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(12),
              child: BookItemView(bookItem: snapshot.data![index]),
            ),
          );
        },
      ),
    );
  }
}

class BookItemView extends StatelessWidget {
  const BookItemView({
    super.key,
    required this.bookItem,
  });
  final NaverBookDto bookItem;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Image.network(bookItem.image!),
      title: Text(bookItem.title!),
      subtitle: Text(bookItem.author!),
      children: [
        paddingText(
          child: Text(
            bookItem.title!,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        paddingText(
          child: Text(bookItem.description!),
        ),
        paddingText(
          child: Text(bookItem.link!),
        ),
      ],
    );
  }

  // 함수로 분리한 후 return type을 Widget으로 변경
  Widget paddingText({required Text child}) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: child,
    );
  }
}
