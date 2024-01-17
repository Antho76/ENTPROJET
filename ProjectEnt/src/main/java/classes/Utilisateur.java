// Utilisateur.java
package classes;

import java.util.List;

public class Utilisateur {
    private String identifiant;
    private String motdepasse;
    private String type;

    public Utilisateur(String identifiant, String motdepasse, String type) {
        this.identifiant = identifiant;
        this.motdepasse = motdepasse;
        this.type = type;
    }
    
    public Utilisateur() {
    	this.identifiant="a";
    	this.motdepasse="a";
    	this.type="etudiant";
    }

    public String getIdentifiant() {
        return identifiant;
    }

    public String getMotdepasse() {
        return motdepasse;
    }

    public String getType() {
        return type;
    }
}
