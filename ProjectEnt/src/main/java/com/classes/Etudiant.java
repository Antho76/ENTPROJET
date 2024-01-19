package com.classes;
import java.util.ArrayList;

public class Etudiant extends Utilisateur{

    private String nom;
    private String prenom;
    private String spe;
    private String INE;
    private Module module;
    
    public Etudiant(String nom, String prenom, String spe, String INE, String id, String mdp, String type, Module module) {
        super(id,mdp,type);
        this.nom = nom;
        this.prenom = prenom;
        this.spe = spe;
        this.INE = INE;
        this.module = module;
        
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
    public Module getModule() {
    	return this.module;
    }


  

    public String toString() {
    	return "nom : "+ this.nom + "prenom : " +this.prenom + "specialite : " + this.spe + "INE : "+ this.INE + "module : "+ this.module.getNom();   
    			}

    // Autres méthodes si nécessaire
}
