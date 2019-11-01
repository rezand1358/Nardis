import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:nardis/bloc/register/register_bloc.dart';
import 'package:nardis/bloc/register/register_state.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/data/soaps/soap_save_customer.dart';
import 'package:nardis/models/customer.dart';
import 'package:nardis/models/viewmodels/api_customer.dart';

@immutable
abstract class RegisterEvent {
  Future<RegisterState> applyAsync(
      {RegisterState currentState, RegisterBloc bloc});
  
}
class InitRegisterEvent extends RegisterEvent {
  @override
  String toString() => 'InitRegisterEvent';

  @override
  Future<RegisterState> applyAsync({RegisterState currentState, RegisterBloc bloc}) async{
    // TODO: implement applyAsync
    return new UnRegisterState();
  }

}

class LoadRegisterEvent extends RegisterEvent {

  Customer customer;
  BuildContext context;
  LoadRegisterEvent(this.customer,this.context);

  @override
  String toString() => 'LoadRegisterEvent';

  @override
  Future<RegisterState> applyAsync({RegisterState currentState, RegisterBloc bloc}) async {
    
   try {
      List<ApiCustomer> apiCustomers=new List();
      ApiCustomer apiCustomer=new ApiCustomer();
      customer.long='0';
      customer.lat='0';
      customer.postalCode='';
      customer.tel=customer.mobile;
      customer.email=customer.mobile+'@mail.com';
      customer.socialNo='1234567890';
      customer.address=customer.mobile;
      apiCustomer=ApiCustomer.map(customer.toMap());
      apiCustomers.add(apiCustomer);
      new SoapSaveCustomer(context: context).call(SoapConstants.METHOD_SAVE_CUSTOMER,  jsonEncode(apiCustomers.map((c) => c.toMap()).toList()));
      return new InRegisterState();
    } catch (_, stackTrace) {
      return new ErrorRegisterState(_?.toString());
    }
  }
}

class RegisteredEvent extends RegisterEvent {
  Customer user;

  RegisteredEvent({this.user});
  @override
  String toString() => 'RegisteredEvent';

  @override
  Future<RegisterState> applyAsync(
      {
        RegisterState currentState, RegisterBloc bloc}) async {
    try {
     
      
      return new RegisteredState();
    } catch (_, stackTrace) {
     
      return new ErrorRegisterState(_?.toString());
    }
  }
}