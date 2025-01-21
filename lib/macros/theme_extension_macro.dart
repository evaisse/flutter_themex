// import 'package:macros/macros.dart';

// macro class ThemeExtensionMacro implements ClassDeclarationsMacro {
//   const ThemeExtensionMacro();

//   @override
//   void buildDeclarationsForClass(ClassDeclaration clazz, ClassDeclarationBuilder builder) {
//     // Récupérer les champs de la classe
//     final fields = clazz.fields.where((field) => field.isFinal);

//     // Générer le constructeur
//     final constructorParams = fields.map((field) {
//       return 'required this.${field.name}';
//     }).join(', ');

//     builder.declareInClass('''
//       const ${clazz.name}({
//         $constructorParams,
//       });
//     ''');

//     // Générer la méthode copyWith
//     final copyWithParams = fields.map((field) {
//       return '${field.type} ${field.name}';
//     }).join(', ');

//     final copyWithAssignments = fields.map((field) {
//       return '${field.name}: ${field.name} ?? this.${field.name}';
//     }).join(', ');

//     builder.declareInClass('''
//       @override
//       ${clazz.name} copyWith({$copyWithParams}) {
//         return ${clazz.name}(
//           $copyWithAssignments,
//         );
//       }
//     ''');

//     // Générer la méthode lerp
//     final lerpAssignments = fields.map((field) {
//       return '${field.name}: Color.lerp(${field.name}, other.${field.name}, t)';
//     }).join(', ');

//     builder.declareInClass('''
//       @override
//       ${clazz.name} lerp(${clazz.name}? other, double t) {
//         if (other is! ${clazz.name}) {
//           return this;
//         }
//         return ${clazz.name}(
//           $lerpAssignments,
//         );
//       }
//     ''');

//     // Générer la méthode toString
//     final toStringFields = fields.map((field) {
//       return '${field.name}: \${${field.name}}';
//     }).join(', ');

//     builder.declareInClass('''
//       @override
//       String toString() => '${clazz.name}($toStringFields)';
//     ''');
//   }
// }
