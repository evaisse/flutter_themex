import 'dart:async';
import 'package:macros/macros.dart';
import 'package:themex/macros/macro_helper.dart';

macro class ThemeMacro implements ClassDeclarationsMacro {
  ///Les imports doivent être séparés d'une virgurle parce que les macros ne gère pas les list ni les set
  final String imports;

  const ThemeMacro({this.imports = ""});

  @override
  Future<void> buildDeclarationsForClass(ClassDeclaration clazz, MemberDeclarationBuilder builder,) async {
    final className = clazz.identifier.name;
    final fields = await builder.fieldsOf(clazz);

    final importsList = imports.split(",");
    for (final import in importsList) {
      if (import.isNotEmpty) {
        builder.declareInLibrary(DeclarationCode.fromParts(["import ", "'", import, "'", ";", "\n"]));
      }
    }

    ///Build the constructor
    builder.declareInType(
      DeclarationCode.fromParts([
        'const $className({',
        MacroHelper.getAllFieldsInString(fields: fields, forConstructor: true,),
        "\n });\n",
      ]),
    );

    ///Build the copyWith
    builder.declareInType(
      DeclarationCode.fromString(
          """
        @override
        $className copyWith ({
          ${MacroHelper.getAllFieldsInString(fields: fields, nullable: true, withType: true,)},
        }) {
          return $className(
            ${fields.map((field) => "${field.identifier.name}: ${field.identifier.name} ?? this.${field.identifier
              .name}",).join(
            ',\n',)}
          );
        }
      """
      ),);

    builder.declareInType(DeclarationCode.fromString(
        """
        @override
        $className lerp($className other, double t) {
          if (other is! $className) {
            return this;
          }
        
          return $className(
            ${fields.map((field) {
          final baseType = MacroHelper.getBaseType(field: field);

          return "\n ${field.identifier.name}: ${MacroHelper.isPrimitive(baseType) ? "" : "$baseType.lerp(${field
              .identifier
              .name}, other.${field.identifier.name}, t) ??"} ${field.identifier.name}";
        }).join(',')}
          );
        }
      """
    ),);
  }
}