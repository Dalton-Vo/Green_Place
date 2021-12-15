import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flag/flag.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localization_release/helpers/news_repository.dart';
import 'package:localization_release/services/news_bloc.dart';
import 'package:localization_release/services/news_states.dart';
import 'package:localization_release/services/statesprovider/currentuser.dart';
import 'package:localization_release/views/NewsAPI/splash_screen.dart';
import 'package:localization_release/views/QR_code/scanner.dart';
import 'package:localization_release/views/cart/componentsbottombar/homepage.dart';
import 'package:localization_release/views/login_signup/login/login.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // MultiBlocProvider(
        //   providers: [
        //     BlocProvider<NewsBloc>(
        //       create: (context) => NewsBloc(
        //           initialState: NewsInitState(), newsRepositoty: NewsRepository()),
        //     )
        //   ],
        // child:

        // ChangeNotifierProvider sẽ lắng nghe sự thay đổi của object mà nó cung cấp. Khi object có sự thay đổi,
        //widget được return từ builder function của Consumer sẽ được render lại
        ChangeNotifierProvider(
      //Tạo ngữ cảnh và tạo một phiên bản người dùng
      //Từ đó có để truy cập vào người dùng mà chúng ta muốn
      create: (context) => CurrentUser(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Localizations Sample App',
        //Nhận một chức năng trình tạo ngữ cảnh để gọi đối tượng S và sau đó lấy appTitle
        onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor: Colors.white,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            )),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        // Gọi đến lớp tùy chỉnh
        supportedLocales: S.delegate.supportedLocales,
        home: Login(),
      ),
    );
  }
}
