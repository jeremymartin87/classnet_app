
part of 'cours.dart';

class CoursAdapter extends TypeAdapter<Cours> {
  @override
  final int typeId = 1;

  @override
  Cours read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cours(
      name: fields[0] as String,
      theme: fields[1] as String,
      image: fields[2] as String,
      text: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Cours obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.theme)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CoursAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}

