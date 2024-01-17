package com.classes;

public class Notes {
        // Attributs
        private double valeur;
        private String module;
        private int semestre;
        private String idEtudiant;

        // Constructeur
        public Notes(double valeur, String module, int semestre, String idEtudiant) {
            this.valeur = valeur;
            this.module = module;
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

        public String getModule() {
            return module;
        }

        public void setModule(String module) {
            this.module = module;
        }
        
        public int getSemestre() {
            return this.semestre;
        }
        
        public String getINE() {
            return this.idEtudiant;
        }
}