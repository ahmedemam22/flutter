import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/auth_provider.dart';
import 'package:shop/providers/cart_provider.dart';
import 'package:shop/providers/order_provider.dart';
import 'package:shop/providers/product_provider.dart';
import 'package:shop/screen/Edit_product.dart';
import 'package:shop/screen/auth_screen.dart';
import 'package:shop/screen/cart.dart';
import 'package:shop/screen/order_screen.dart';
import 'package:shop/screen/product_details.dart';
import 'package:shop/screen/product_screen.dart';
import 'package:shop/screen/splash_screen.dart';
import 'package:shop/screen/user_product.dart';
import 'package:shop/widgets/order_item.dart';

import 'helpers/custom_transition.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*ChangeNotifierProvider(
      builder: (context)=>ProductProvider(),*///alternative syntax
    return MultiProvider(
      providers: [


        ChangeNotifierProvider.value(
          value: AuthProvider(),
        ),
        ChangeNotifierProxyProvider<AuthProvider, ProductProvider>(
          builder: (ctx, auth, previousProducts) => ProductProvider(
            auth.token,
            auth.userId,
            previousProducts == null ? [] : previousProducts.items,
          ),
        ),
        ChangeNotifierProvider.value(
          value: CartProvider(),
        ),
        ChangeNotifierProxyProvider<AuthProvider, OrderProvider>(
          builder: (ctx, auth, previousOrders) => OrderProvider(
            auth.token,

            previousOrders == null ? [] : previousOrders.items,
            auth.userId
          ),
        ),
      ],
        child:  Consumer<AuthProvider>(
        builder: (ctx, auth, _) => MaterialApp(
      title: 'MyShop',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CustomPageTransitionBuilder(),
            TargetPlatform.iOS: CustomPageTransitionBuilder(),
          },
        ),

      ),
      home: auth.isAuth
          ? Product()
          : FutureBuilder(
        future: auth.tryAutoLogin(),
        builder: (ctx, authResultSnapshot) =>
        authResultSnapshot.connectionState ==
            ConnectionState.waiting
            ? SplashScreen()
            : AuthScreen(),
      ),

      routes: {
            '/details':(context)=>ProductDetails(),
            '/product':(context)=>Product(),
            '/cart':(context)=>Cart(),
            '/auth':(context)=>AuthScreen(),
            '/order':(context)=>OrderScreen(),
            '/yourproduct':(context)=>UserProductScreen(),
            '/edit':(context)=>EditProductScreen(),
          },
        ),
        ));

  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
