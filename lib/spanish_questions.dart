import 'classes/assert.dart';

class SpanishQuestions {
  List<Assert> _spanishQuestions = [
    Assert(question: 'El animal nacional de Escocia es un unicornio', answer: true),
    Assert(
        question: 'Los humanos pueden distinguir sobre un trillón de olores diferentes.',
        answer: true),
    Assert(
        question: 'Si cortas una lombriz de tierra por la mitad, las dos partes pueden regenerar su cuerpo.',
        answer: false),
    Assert(question: 'Si lloras en el espacio tus lágrimas se pegarían en la cara.', answer: true),
    Assert(
        question: 'Los cabellos y las uñas siguen creciendo después de la muerte.',
        answer: false),
    Assert(
        question: 'Los humanos puedes respirar y tragar al mismo tiempo.',
        answer: false),
    Assert(
        question:
            'Buzz Aldrin fue el primer hombre en orinar en la Luna.',
        answer: true),
    Assert(
        question:
            'Tenemos un promedio de entre 400 mil y 500 mil pelos en la cabeza.',
        answer: false),
    Assert(
        question:
            'Si tiras un centavo desde lo alto de un rascacielos, puedes atravesarle el cráneo a alguien.',
        answer: false),
    Assert(
        question:
            'Los humanos brillan en la oscuridad.',
        answer: true),
    Assert(question: 'El mismo inventor de la lámpara incandescente inventó la silla eléctrica.', answer: true),
    Assert(
        question:
            'Gabriel García Márquez escribió 100 años de soledad.',
        answer: true),
    Assert(
        question:
            'Los encendedores fueron inventados antes que los fósforos.',
        answer: true),
  ];

  getSpanishQuestions() => _spanishQuestions;
}