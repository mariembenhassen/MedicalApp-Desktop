class Patient {
  final speciality;
  final plansTraitement;
  final sexe;
  final notesSuivi;
  final historiqueDeToxicomanie;
  final relationIDMed;
  final antecedentsMedicaux;
  final relationIDPara;
  final actesTransfusionnels;
  final dateDeCreation;
  final statut;
  final compteRenduOperatoire;
  final informationsSurLesSoins;
  final typeDePriseEnCharge;
  final dmp;
  final evaluationsCliniques;
  final consentementEcritDuPatient;
  final dossierDAnesthesie;
  final motifsDHospitalisation;
  final prescriptionMedicale;
  final groupeSanguin;
  final lettreDuMedecin;
  final idPatient;
  final consentements;
  final maladieActuelle;
  final antecedentsEtFacteursDeRisques;
  final conclusionsDeLEvaluationClinique;
  final age;
  final idDmp;
  final etat_actuel;

  Patient(
      {required this.speciality,
      required this.plansTraitement,
      required this.sexe,
      required this.notesSuivi,
      required this.historiqueDeToxicomanie,
      required this.relationIDMed,
      required this.antecedentsMedicaux,
      required this.relationIDPara,
      required this.actesTransfusionnels,
      required this.dateDeCreation,
      required this.statut,
      required this.compteRenduOperatoire,
      required this.informationsSurLesSoins,
      required this.typeDePriseEnCharge,
      required this.dmp,
      required this.evaluationsCliniques,
      required this.consentementEcritDuPatient,
      required this.dossierDAnesthesie,
      required this.motifsDHospitalisation,
      required this.prescriptionMedicale,
      required this.groupeSanguin,
      required this.lettreDuMedecin,
      required this.idPatient,
      required this.consentements,
      required this.maladieActuelle,
      required this.antecedentsEtFacteursDeRisques,
      required this.conclusionsDeLEvaluationClinique,
      required this.age,
      required this.idDmp,
      required this.etat_actuel});

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
        speciality: json['specialité'],
        plansTraitement: json['Plans_Traitement'],
        sexe: json['sexe'],
        notesSuivi: json['Notes_Suivi'],
        historiqueDeToxicomanie: json['historique_de_toxicomanie'],
        relationIDMed: List<Map<String, dynamic>>.from(json['Relation_ID_med']),
        antecedentsMedicaux: json['Antécédents_Médicaux'],
        relationIDPara:
            List<Map<String, dynamic>>.from(json['Relation_ID_para']),
        actesTransfusionnels: json['Actes_transfusionnels'],
        dateDeCreation: json['Date_de_création'],
        statut: json['Statut'],
        compteRenduOperatoire: json['Compte_rendu_opératoire'],
        informationsSurLesSoins: json['Informations_sur_les_soins'],
        typeDePriseEnCharge: json['Type_de_prise_en_charge'],
        dmp: json['Dmp'],
        evaluationsCliniques: json['Évaluations_Cliniques'],
        consentementEcritDuPatient: json['Consentement_écrit_du_patient'],
        dossierDAnesthesie: json['Dossier_d_anesthésie'],
        motifsDHospitalisation: json['Motifs_d_hospitalisation'],
        prescriptionMedicale: json['Prescription_médicale'],
        groupeSanguin: json['groupe_sanguin'],
        lettreDuMedecin: json['Lettre_du_médecin'],
        idPatient: json['ID_Patient'],
        consentements: json['Consentements'],
        maladieActuelle: json['Maladie_actuelle'],
        antecedentsEtFacteursDeRisques:
            json['Antécédents_et_facteurs_de_risques'],
        conclusionsDeLEvaluationClinique:
            json['Conclusions_de_l_évaluation_clinique'],
        age: Map<String, dynamic>.from(json['age']),
        idDmp: json['ID_DMP'] ?? '',
        etat_actuel: json['etat_actuel']);
  }
}
