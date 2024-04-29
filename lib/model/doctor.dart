class Doctor {
  final statutDeGarde;
  final numeroDepartement;
  final adhesionsProfessionnelles;
  final numeroDeCabinet;
  final languesParlees;
  final sexe;
  final dateDeNaissance;
  final motDePasse;
  final certifications;
  final idStaff;
  final nom;
  final numeroDeSecuriteSociale;
  final qualifications;
  final hopital;
  final prenom;
  final adresse;
  final disponibilite;
  final numeroDeTelephone;
  final specialite;
  final email;

  Doctor({
    required this.statutDeGarde,
    required this.numeroDepartement,
    required this.adhesionsProfessionnelles,
    required this.numeroDeCabinet,
    required this.languesParlees,
    required this.sexe,
    required this.dateDeNaissance,
    required this.motDePasse,
    required this.certifications,
    required this.idStaff,
    required this.nom,
    required this.numeroDeSecuriteSociale,
    required this.qualifications,
    required this.hopital,
    required this.prenom,
    required this.adresse,
    required this.disponibilite,
    required this.numeroDeTelephone,
    required this.specialite,
    required this.email,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      statutDeGarde: json['statut_de_garde'].toString(),
      numeroDepartement: json['numero_departement'].toString(),
      adhesionsProfessionnelles: List<String>.from(
          json['adhésions_professionnelles'].map((item) => item.toString())),
      numeroDeCabinet: json['Numero_de_Cabinet'].toString(),
      languesParlees: List<String>.from(
          json['langues_parlées'].map((item) => item.toString())),
      sexe: json['sexe'].toString(),
      dateDeNaissance: json['date_de_naissance'].toString(),
      motDePasse: json['motpass'].toString(),
      certifications: List<String>.from(
          json['certifications'].map((item) => item.toString())),
      idStaff: json['id_staff'].toString(),
      nom: json['nom'].toString(),
      numeroDeSecuriteSociale: json['numéro_de_securité_sociale'].toString(),
      qualifications: json['qualifications'].toString(),
      hopital: json['hopital'].toString(),
      prenom: json['prénom'].toString(),
      adresse: json['adresse'].toString(),
      disponibilite: json['disponibilité'].toString(),
      numeroDeTelephone: json['numéro_de_téléphone'].toString(),
      specialite: json['spécialité'].toString(),
      email: json['email'].toString(),
    );
  }
}
