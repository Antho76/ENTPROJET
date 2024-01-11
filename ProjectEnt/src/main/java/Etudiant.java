import java.util.ArrayList;

public class Etudiant extends Utilisateur{

    private String nom;
    private String prenom;
    private String spe;
    private int INE;
    private ArrayList<Notes> notes;

    public Etudiant(String nom, String prenom, String spe, int INE, String id, String mdp, String type) {
        super(id,mdp,type);
        this.nom = nom;
        this.prenom = prenom;
        this.spe = spe;
        this.INE = INE;
        
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

    public ArrayList<Notes> getNotes() {
        return this.notes;
    }

    // Méthode pour ajouter une note
    public void ajouterNote(Notes nouvelleNote) {
        
        this.notes.add(nouvelleNote);
    }
  }
        