import java.util.List;

public class Etudiant {

    private String nom;
    private String prenom;
    private String spe;
    private String INE;
    private double[] notes;

    public Etudiant(String nom, String prenom, String spe, String INE) {
        this.nom = nom;
        this.prenom = prenom;
        this.spe = spe;
        this.INE = INE;
        this.notes = new double[0]; // Initialisation d'un tableau vide de notes
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

    public double[] getNotes() {
        return this.notes;
    }

    // Méthode pour ajouter une note
    public void ajouterNote(double nouvelleNote) {
        // Création d'un nouveau tableau avec une case de plus
        double[] nouveauTableau = new double[this.notes.length + 1];

        // Copie des anciennes notes dans le nouveau tableau
        for (int i = 0; i < this.notes.length; i++) {
            nouveauTableau[i] = this.notes[i];
        }

        // Ajout de la nouvelle note à la fin du tableau
        nouveauTableau[this.notes.length] = nouvelleNote;

        // Remplacement du tableau de notes par le nouveau tableau
        this.notes = nouveauTableau;
    }
    
    public String toString() {
    	return "nom : "+ this.nom + "prenom : " +this.prenom + "specialite : " + this.spe + "INE : "+ this.INE;   
    			}
    
    public static String afficherTousLesEtudiants(List<Etudiant> listeEtudiants) {
        StringBuilder sb = new StringBuilder();
        for (Etudiant etudiant : listeEtudiants) {
            sb.append(etudiant.toString()).append("<br>"); // 
        }
        return sb.toString();
    }

    
}
