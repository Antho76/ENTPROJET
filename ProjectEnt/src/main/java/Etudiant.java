public class Etudiant {

    private String nom;
    private String prenom;
    private String spe;
    private int INE;
    
    public Etudiant(String nom, String prenom, String spe, int INE) {
        this.nom = nom;
        this.prenom=prenom;
        this.spe=spe;
        this.INE=INE;
    }
    
    public String getNom() {
        return this.nom;
    }
    
    public String getPrenom() {
        return this.prenom;
    }
    
    public String getSpe() {
        return this.spe;
    }
    
    public int getIne() {
        return this.INE;
    }
}