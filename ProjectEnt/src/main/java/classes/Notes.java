package classes;
public class Notes {
        // Attributs
        private double valeur;
        private String module;
        private int semestre;
        private Etudiant etudiant;

        // Constructeur
        public Notes(double valeur, String module, int semestre, Etudiant etudiant) {
            this.valeur = valeur;
            this.module = module;
            this.semestre = semestre;
            this.etudiant=etudiant;
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
        
        public Etudiant getEtudiant() {
            return this.etudiant;
        }
}