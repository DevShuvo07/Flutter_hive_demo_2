// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BankAdapter extends TypeAdapter<Bank> {
  @override
  final int typeId = 2;

  @override
  Bank read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bank(
      id: fields[0] == null ? 0 : fields[0] as int,
      name: fields[1] as String,
      amount: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Bank obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BankAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
