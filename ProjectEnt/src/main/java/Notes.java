public class Notes {
	    // Attributs
	    private double valeur;
	    private String module;

	    // Constructeur
	    public Notes(double valeur, String module) {
	        this.valeur = valeur;
	        this.module = module;
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
}
