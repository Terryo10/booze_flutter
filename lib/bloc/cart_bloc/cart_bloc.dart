import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:booze_flutter/models/cart/cart_items.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../models/categories/categories_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final FlutterSecureStorage storage;
  CartBloc(this.storage) : super(CartInitial()) {
    int cartCount = 0;
    num totalPrice = 0;

    on<AddToCart>((event, emit) async {
      emit(CartLoadingState());
      //get storage cart
      var items = await storage.read(key: 'cartItems');
      List<CartItems> storageCartItems = [];
      if (items != null) {
        try {
          List unModelledCartItems = await jsonDecode(items); //storage
          //check if list contains
          for (var element in unModelledCartItems) {
            storageCartItems.add(CartItems(
                product: Product.fromJson(element["product"]),
                quantity: element["quantity"]));
          }

          var contain = storageCartItems
              .where((element) => element.product.id == event.product.id);
          if (contain.isEmpty) {
            //  value is not yet in old cart
            storageCartItems
                .add(CartItems(product: event.product, quantity: 1));
            //value is in cart
            String? obj = jsonEncode(storageCartItems);
            storage.write(key: 'cartItems', value: obj);
            totalPrice = 0;
            for (var element in storageCartItems) {
             totalPrice += (element.product.price! * element.quantity);
            }
            emit(CartLoadedState(
                total: double.parse(totalPrice.toString()),
                cartItems: storageCartItems,
                cartCount: cartCount + storageCartItems.length));
          } else {
            contain.first.quantity = contain.first.quantity + 1;

            String? obj = jsonEncode(storageCartItems);
            storage.write(key: 'cartItems', value: obj);
            totalPrice = 0;
            for (var element in storageCartItems) {
             totalPrice += (element.product.price! * element.quantity);
            }
            emit(CartLoadedState(
                total: double.parse(totalPrice.toString()),
                cartItems: storageCartItems,
                cartCount: cartCount + storageCartItems.length));
          }
        } catch (e) {
          if (kDebugMode) {
            print(e.toString());
          }
        }
      } else {
        // make a new cart
        storageCartItems.add(CartItems(product: event.product, quantity: 1));
        //value is in cart
        String? obj = jsonEncode(storageCartItems);
        storage.write(key: 'cartItems', value: obj);
        totalPrice = 0;
        for (var element in storageCartItems) {
          totalPrice += (element.product.price! * element.quantity);
        }
        emit(CartLoadedState(
            total: double.parse(totalPrice.toString()),
            cartItems: storageCartItems,
            cartCount: cartCount + storageCartItems.length));
      }
    });

    on<DecrementFromToCart>((event, emit) async {
      emit(CartLoadingState());
      //get storage cart
      var items = await storage.read(key: 'cartItems');
      List<CartItems> storageCartItems = [];
      if (items != null) {
        try {
          List unModelledCartItems = await jsonDecode(items); //storage
          //check if list contains
          for (var element in unModelledCartItems) {
            storageCartItems.add(CartItems(
                product: Product.fromJson(element["product"]),
                quantity: element["quantity"]));
          }
          var contain = storageCartItems
              .where((element) => element.product.id == event.product.id);
          if (contain.isEmpty) {
            //dont decrement
          } else {
            //decrement
            var value = contain.first;
            if (value.quantity > 1) {
              //decrement
              value.quantity = value.quantity - 1;
              String? obj = jsonEncode(storageCartItems);
              storage.write(key: 'cartItems', value: obj);
              totalPrice = 0;
              for (var element in storageCartItems) {
                totalPrice += (element.product.price! * element.quantity);
              }
              emit(CartLoadedState(
                  total: double.parse(totalPrice.toString()),
                  cartItems: storageCartItems,
                  cartCount: cartCount + storageCartItems.length));
            } else {
              //remove product
              storageCartItems.removeWhere(
                  (element) => element.product.id == event.product.id);
              String? obj = jsonEncode(storageCartItems);
              storage.write(key: 'cartItems', value: obj);
              if (kDebugMode) {
                print(storageCartItems.length);
              }
             
              emit(CartLoadedState(
                  total: double.parse(totalPrice.toString()),
                  cartItems: storageCartItems,
                  cartCount: cartCount + storageCartItems.length));
            }
          }
        } catch (e) {
          if (kDebugMode) {
            print(e.toString());
          }
        }
      }
    });

    on<CartStarted>(
      (event, emit) async {
        emit(CartLoadingState());
        var items = await storage.read(key: 'cartItems');
        List<CartItems> storageCartItems = [];
        if (items != null) {
          try {
            List unModelledCartItems = await jsonDecode(items); //storage
            //check if list contains
            for (var element in unModelledCartItems) {
              storageCartItems.add(CartItems(
                  product: Product.fromJson(element["product"]),
                  quantity: element["quantity"]));
            }
            totalPrice = 0;
            for (var element in storageCartItems) {
              totalPrice += (element.product.price! * element.quantity);
            }
            emit(CartLoadedState(
                total: double.parse(totalPrice.toString()),
                cartItems: storageCartItems,
                cartCount: cartCount + storageCartItems.length));
          } catch (e) {
            if (kDebugMode) {
              print(e.toString());
            }
          }
        } else {
          totalPrice = 0;
          for (var element in storageCartItems) {
            totalPrice += (element.product.price! * element.quantity);
          }
          emit(CartLoadedState(
              total: double.parse(totalPrice.toString()),
              cartItems: storageCartItems,
              cartCount: cartCount + storageCartItems.length));
        }
      },
    );

    on<RemoveFromToCart>((event, emit) async {
      emit(CartLoadingState());
      var items = await storage.read(key: 'cartItems');
      List<CartItems> storageCartItems = [];

      if (items != null) {
        try {
          List unModelledCartItems = await jsonDecode(items); //storage
          //check if list contains
          for (var element in unModelledCartItems) {
            storageCartItems.add(CartItems(
                product: Product.fromJson(element["product"]),
                quantity: element["quantity"]));
          }
          var contain = storageCartItems
              .where((element) => element.product.id == event.product.id);
          if (contain.isEmpty) {
            //dont decrement
          } else {
            //remove from cart
            storageCartItems.removeWhere(
                (element) => element.product.id == event.product.id);
            String? obj = jsonEncode(storageCartItems);
            storage.write(key: 'cartItems', value: obj);
          }
          totalPrice = 0;
          for (var element in storageCartItems) {
            totalPrice += (element.product.price! * element.quantity);
          }

          emit(CartLoadedState(
              total: double.parse(totalPrice.toString()),
              cartItems: storageCartItems,
              cartCount: cartCount + storageCartItems.length));
        } catch (e) {
          if (kDebugMode) {
            print(e.toString());
          }
        }
      } else {
        totalPrice = 0;
        for (var element in storageCartItems) {
          totalPrice += (element.product.price! * element.quantity);
        }
        emit(CartLoadedState(
            total: double.parse(totalPrice.toString()),
            cartItems: storageCartItems,
            cartCount: cartCount + storageCartItems.length));
      }
    });
  }
}
