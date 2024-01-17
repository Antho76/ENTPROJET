package classes;

import java.util.ArrayList;
import java.util.List;

public class Etudiant extends Utilisateur{


    private String nom;
    private String prenom;
    private String spe;
    private String INE;
    private ArrayList<Notes> notes;

    public Etudiant(String nom, String prenom, String spe, String INE, String id, String mdp, String type) {
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

    public String getIne() {
        return this.INE;
    }

    public ArrayList<Notes> getNotes() {
        return this.notes;
    }

    public void ajouterNote(Notes nouvelleNote) {
        
        this.notes.add(nouvelleNote);
    }

  

    public String toString() {
    	return "nom : "+ this.nom + "prenom : " +this.prenom + "specialite : " + this.spe + "INE : "+ this.INE;   
    			}
    
}
