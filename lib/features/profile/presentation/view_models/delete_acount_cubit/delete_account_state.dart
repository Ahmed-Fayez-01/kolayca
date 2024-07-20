part of 'delete_account_cubit.dart';

abstract class DeleteAccountState {}

class DeleteAccountInitial extends DeleteAccountState {}

class DeleteAccountLoading extends DeleteAccountState {}

class DeleteAccountError extends DeleteAccountState {
  final String errMessage;
  DeleteAccountError(this.errMessage);
}

class DeleteAccountSuccess extends DeleteAccountState {}
