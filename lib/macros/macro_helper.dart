import 'package:macros/macros.dart';

class MacroHelper {
  static String getRealType({
    required FieldDeclaration field,
  }) {
    final annotationCode = field.type.code;
    if (annotationCode is NullableTypeAnnotationCode) {
      final underlyingType = annotationCode.underlyingType;
      if (underlyingType is NamedTypeAnnotationCode) {
        return "${underlyingType.name.name}?";
      } else {
        return "On gère pas encore ce cas";
      }
    } else {
      return (field.type.code as NamedTypeAnnotationCode).name.name;
    }
  }

  static String getBaseType({
    required FieldDeclaration field,
  }) {
    final annotationCode = field.type.code;
    if (annotationCode is NullableTypeAnnotationCode) {
      final underlyingType = annotationCode.underlyingType;
      if (underlyingType is NamedTypeAnnotationCode) {
        return underlyingType.name.name;
      } else {
        return "On gère pas encore ce cas";
      }
    } else {
      return (field.type.code as NamedTypeAnnotationCode).name.name;
    }
  }

  static String getTypeWithCustomisation({
    required FieldDeclaration field,
    bool nullable = false,
  }) {
    final realType = getBaseType(field: field);

    return "$realType${nullable ? "?" : ""}";
  }

  static bool isPrimitive(String baseType) {
    const primitiveTypes = {'int', 'double', 'bool', 'String', 'num', 'Null'};

    return primitiveTypes.contains(baseType);
  }

  static String getAllFieldsInString({
    required List<FieldDeclaration> fields,
    bool nullable = false,
    bool withType = false,
    bool forConstructor = false,
  }) {
    return fields
        .map(
          (field) =>
              "${withType ? getTypeWithCustomisation(field: field, nullable: nullable) : ""} ${forConstructor ? "${field.type.isNullable ? "" : "required"} this." : ""}${field.identifier.name}",
        )
        .join(',\n');
  }
}
