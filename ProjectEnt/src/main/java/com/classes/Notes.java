package com.classes;

public class Notes {
        // Attributs
        private double valeur;
        private int module;
        private int matiere;
        private int semestre;
        private String idEtudiant;

        // Constructeur
        public Notes(double valeur, int module, int matiere, int semestre, String idEtudiant) {
            this.valeur = valeur;
            this.module = module;
            this.matiere = matiere;
            this.semestre = semestre;
            this.idEtudiant=idEtudiant;
        }

        // Méthodes d'accès (getters et setters)
        public double getValeur() {
            return valeur;
        }

        public void setValeur(double valeur) {
            this.valeur = valeur;
        }

        public int getModule() {
            return module;
        }
        
        public int getMatiere() {
            return this.matiere;
        }
        

        public void setModule(int module) {
            this.module = module;
        }
        
        public int getSemestre() {
            return this.semestre;
        }
        
        public String getINE() {
            return this.idEtudiant;
        }
}