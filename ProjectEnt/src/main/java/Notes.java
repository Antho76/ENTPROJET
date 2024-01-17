public class Notes {
        // Attributs
        private double valeur;
        private String module;
        private int semestre;
        private int idEtudiant;

        // Constructeur
        public Notes(double valeur, String module, int semestre, int idEtudiant) {
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
        
        public int getIdEtudiant() {
            return this.idEtudiant;
        }
}