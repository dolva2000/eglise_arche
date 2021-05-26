class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});
}

const List facile = [
  {
    "id": 1,
    "question":
        "Quel est le plus long verset de la Bible ?",
    "options": ['genese 8:1', 'luc 22:5', 'Esther 8:9', 'jean 2:5'],
    "answer_index": 2,
  },
  {
    "id": 2,
    "question": "Comment Jean-Baptiste est-il mort ?",
    "options": [ 'decapite', 'accident ', 'la mort volontaire', 'maladie'],
    "answer_index": 0,
  },
  {
    "id": 3,
    "question": "Comment se nomme le fils de Jonathan ?.",
    "options": ['Mephilim', 'Salomon', 'Mephiboscheth', 'Jonas'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "Quel est le chapitre le plus court de la Bible ?",
    "options": ['Jean 15', 'Luc 22', 'jean 12', 'psaume 117'],
    "answer_index": 3,
  },
 
   {
    "id": 5,
    "question": "Comment s'appelait l'homme le plus fort dans la Bible ?",
    "options": ['David', 'Josaphat', 'Samson', 'Goliath'],
    "answer_index": 2,
  },
   {
    "id": 6,
    "question": "Qui a fait pécher Adam et Eve au paradis ?",
    "options": ['Lion', 'Serpent', 'le fruit', 'Eve'],
    "answer_index": 1,
  },
   {
    "id": 7,
    "question": "Qui a été jeté dans la fosse aux lions ?",
    "options": ['Daniel', 'Jesus', 'David', 'Samson'],
    "answer_index": 0,
  },
   {
    "id": 8,
    "question": "Où Jésus prêchait-il lorsqu'il était enfant ?",
    "options": ['Égypte', 'temple de Jérusalem', 'temple de baal', 'ABR'],
    "answer_index": 1,
  },
   {
    "id": 9,
    "question": "Quel prophète a annoncé l'arrivée de Jésus ?",
    "options": ['ABR', 'Ésaïe', 'Jacob', 'Malachie'],
    "answer_index": 1,
  },
   {
    "id": 10,
    "question": "Qui a construit la Tour de Babel ?",
    "options": ['les fils de Cham', 'Noé', 'les fils de jacob', 'Job'],
    "answer_index": 0,
  },
];
const List normal = [
  {
    "id": 1,
    "question":
        "Savez-vous qui est Jésus Christ ?",
    "options": ['Dieu', ' prophète', 'ABR', 'Homme'],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "Qui était le précurseur de Jésus ?.",
    "options": ['Hérode', 'Jean-Baptiste', 'Pierre', 'ABR'],
    "answer_index": 1,
  },
  {
    "id": 3,
    "question": "Qui est devenu le premier roi des 10 tribus qui se sont séparées ?",
    "options": ['Noé', ' Jéroboam', 'David', 'Josaphat'],
    "answer_index": 1,
  },
  {
    "id": 4,
    "question": "Qui a été le premier prophète nommé dans la Bible ?",
    "options": ['Abraham', 'Adam ', 'Abel', 'Moise'],
    "answer_index": 0,
  },
   
   {
    "id": 5,
    "question": "Qui a déplacé la pierre avec laquelle le tombeau de Jésus a été recouvert ?",
    "options": ['Marie', 'un ange du Seigneur', 'Le Romain', 'ABR'],
    "answer_index": 1,
  },
   {
    "id": 6,
    "question": "Quel est le livre le plus court de la Bible ?",
    "options": ['Jude', 'ABR', 'Génèse ', 'Deuxième épître de Jean'],
    "answer_index": 3,
  },
   {
    "id": 7,
    "question": "Qui a douté que Jésus ait marché sur l'eau ?",
    "options": ['Jean', 'Pierre', 'ABR', 'Thomas'],
    "answer_index": 1,
  },
   {
    "id": 8,
    "question": "Qui a coupé les cheveux de Samson ?",
    "options": ['Pierre', 'ABR', 'Jean', 'Delilah'],
    "answer_index": 3,
  },
   {
    "id": 9,
    "question": "Qui a dit « Il faut que vous naissiez de nouveau » ?",
    "options": ['Jésus à Nicodème', 'ABR', 'Jésus à Pierre', 'Nicodéme à Jésus'],
    "answer_index": 0,
  },
   {
    "id": 10,
    "question": "En quelle langue Jésus parla-t-il à Saul ?",
    "options": ['Le grec', 'ABR', 'langue des anges', ' langue hébraïque'],
    "answer_index": 3,
  },
];
const List difficile= [
  {
    "id": 1,
    "question":
        "Combien y a-t-il de générations d'Abraham à Jésus ?",
    "options": ['42', '41', '23','24'],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "Où était Jésus quand il fut arrêté ?",
    "options": ['Cana ', 'Cyrène ', ' ABR', ' le jardin de Gethsémani'],
    "answer_index": 3,
  },
  {
    "id": 3,
    "question": "Qui porta la croix de Jésus ?",
    "options": ['Simon Pierre', 'Jean', 'Judas', 'Simon de Cyrène'],
    "answer_index": 3,
  },
  {
    "id": 4,
    "question": "Sur le dos de quel animal Jésus fit-il son entrée dans la ville de Jérusalem ?",
    "options": ['Un ânon', 'Cheval', 'Un Aigle', 'ABR'],
    "answer_index": 0,
  },
 
   {
    "id": 5,
    "question": "Quel disciple suivit Jésus de loin ?",
    "options": ['Pierre', 'Jean', 'Marie', 'Isaac'],
    "answer_index": 0,
  },
   {
    "id": 6,
    "question": "En quelle langue a été écrit le Nouveau Testament ?",
    "options": ['En grec', 'En Araméen', 'ABR', 'Chinois'],
    "answer_index": 0,
  },
   {
    "id": 7,
    "question": "Quelle est la signification de : Tabitha ?",
    "options": ['Ruth', 'Sephora', 'Daniel', 'Dorcas'],
    "answer_index": 3,
  },
    {
    "id": 8,
    "question": "Qui était le meilleur ami de David ?",
    "options": ['Nathan', 'Jonathan', 'jésus', 'Samuel'],
    "answer_index": 2,
  },
   {
    "id": 9,
    "question": "Qui a survécu à la destruction de Sodome et Gomorrhe ?",
    "options": ['Il n y avait pas de survivants', 'Abraham', 'Lot', 'ABR'],
    "answer_index": 2,
  },
   {
    "id": 10,
    "question": "Quels prophètes sont apparus pendant la Transfiguration ?",
    "options": ['Moïse', 'Élie et Élisée', 'Moïse et Élie', 'Survivre à une morsure de serpent'],
    "answer_index": 2,
  },
  

];