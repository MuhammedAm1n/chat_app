part of 'rigster_cubit.dart';

@immutable
abstract class RigsterState {}

class RigsterInitial extends RigsterState {}

class RigsterSuccs extends RigsterState {}

class RigsterLoading extends RigsterState {}

class RigsterFaliuer extends RigsterInitial {
  RigsterFaliuer({required this.eMassge});
  String eMassge;
}
