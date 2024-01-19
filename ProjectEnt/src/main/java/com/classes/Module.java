package com.classes;

import java.util.Arrays;

public class Module {
    private int id;
    private String nom;
    private Matiere[] matieres;

    // Constructeur
    public Module(int id, String nom, Matiere[] matieres) {
        this.id = id;
        this.nom = nom;
        this.matieres = matieres;
    }

    // Getters et Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Matiere[] getMatieres() {
        return matieres;
    }

    public void setMatieres(Matiere[] matieres) {
        this.matieres = matieres;
    }

    // Autres méthodes si nécessaire
    @Override
    public String toString() {
        return "Module{" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                ", matieres=" + Arrays.toString(matieres) +
                '}';
    }
 // Dans la classe Module
    public String getMatiereNomById(int matiereId) {
        for (Matiere matiere : matieres) {
            if (matiere.getId() == matiereId) {
                return matiere.getNom();
            }
        }
        return "";
    }
 // Dans la classe Module
    public Matiere getMatiereById(int matiereId) {
        for (Matiere matiere : matieres) {
            if (matiere.getId() == matiereId) {
                return matiere;
            }
        }
        return null;
    }
}
