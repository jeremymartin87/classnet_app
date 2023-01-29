
part of 'my_cours.dart';



class MyCoursAdapter extends TypeAdapter<My_Cours> {
  @override
  final int typeId = 2;

  @override
  My_Cours read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return My_Cours(
      cours: fields[0] as Cours,
    );
  }

  @override
  void write(BinaryWriter writer, My_Cours obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.cours);
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

