package com.classes;

public class Evaluation {
    
    private int QualiSup;
    private int QualiEq;
    private int Travail;
    private String Com;
    private int Module;
    
    public Evaluation(int quali1, int quali2, int t, String com, int mod) {
        this.QualiSup = quali1;
        this.QualiEq = quali2;
        this.Travail = t;
        this.Com = com;
        this.Module = mod;
    }
    
    public int getQualiSup() {
        return QualiSup;
    }
    
    public int getQualiEq() {
        return QualiEq;
    }
    
    public int getTravail() {
        return Travail;
    }
    
    public String getCom() {
        return Com;
    }
    
    public int getMod() {
        return Module;
    }
}