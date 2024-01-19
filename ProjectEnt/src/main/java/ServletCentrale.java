import com.classes.*;
import com.classes.Module;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Servlet implementation class ServletCentrale
 */
@WebServlet("/ServletCentrale")

public class ServletCentrale extends HttpServlet {
	private static final long serialVersionUID = 1L;
    int nbappel = 0;
    private List<Utilisateur> utilisateurs = new ArrayList<>();
    private List<Etudiant> etudiants = new ArrayList<>();
    private List<Notes> notes = new ArrayList<>();
    private List<Matiere> matieres = new ArrayList<>();
    private List<Module> modules = new ArrayList<>();
    private Map<String, List<String>> matieresMap = new HashMap<>();
    private List<Evaluation> evaluations = new ArrayList<>();
    private int auth = 0;


    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCentrale() {
        super();
        // Ajoutez des utilisateurs de base
        utilisateurs.add(new Utilisateur("admin", "adminpass", "admin"));
        utilisateurs.add(new Utilisateur("eleve", "elevepass", "eleve"));
        etudiants.add(new Etudiant("Pain", "Anthonin", "maçonnerie", "0", "antho","pass", "eleve" ));
        etudiants.add(new Etudiant("Didier","Deschamps","info","rffsj5","4","ea","eleve"));

        matieres.add(new Matiere(0, "Français"));
        matieres.add(new Matiere(1, "Anglais"));
        matieres.add(new Matiere(2, "Analyse"));
        matieres.add(new Matiere(3, "Algèbre"));
        matieres.add(new Matiere(4, "Langage C"));
        matieres.add(new Matiere(5, "BDD"));
        
        evaluations.add(new Evaluation(3,3,3,"test",1));
        evaluations.add(new Evaluation(2,3,5,"test",0));
        evaluations.add(new Evaluation(5,5,5,"test",2));
        evaluations.add(new Evaluation(4,4,2,"test",1));
        evaluations.add(new Evaluation(5,3,4,"test",0));
        evaluations.add(new Evaluation(5,4,3,"test",2));

        
        // Ajouter des modules spécifiques avec les matières correspondantes
        modules.add(new Module(0, "Module Littéraire", new Matiere[]{matieres.get(0), matieres.get(1)}));
        modules.add(new Module(1, "Module Mathématique", new Matiere[]{matieres.get(2), matieres.get(3)}));
        modules.add(new Module(2, "Module informatique", new Matiere[]{matieres.get(4), matieres.get(5)}));
        
        notes.add(new Notes(12, 0,0,0,"0"));
        
        for (Module module : modules) {
            List<String> matieresList = new ArrayList<>();
            for (Matiere matiere : module.getMatieres()) {
                matieresList.add(matiere.getNom());
            }
            matieresMap.put(module.getNom(), matieresList);
        }
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    /**
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	response.getWriter().println("<html><body>Bonjour tt le monde!!");
    	response.getWriter().println("<p>appel numero: " + (++nbappel) + "</p></body></html>");
    }
     * @throws JSONException 
    */
    
    
    private void setModulesAndMatieresAsAttributes(HttpServletRequest request) {
        request.setAttribute("modules", modules);
        request.setAttribute("matieresMap", matieresMap);
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("auth", auth);

		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if ("affichageStudent".equals(action)) {
			request.setAttribute("etudiants", etudiants);
			RequestDispatcher dispatcher = request.getRequestDispatcher("AffichageStudent.jsp");
	        dispatcher.forward(request, response);
		} else if ("affichageEvaluations".equals(action)) {
	        request.setAttribute("evaluations", evaluations);

	        // Récupérer la liste des modules et la définir dans la requête
	        List<String> modulesList = modules.stream().map(Module::getNom).collect(Collectors.toList());
	        request.setAttribute("modules", modules);

	        RequestDispatcher dispatcher = request.getRequestDispatcher("AffichageEvaluation.jsp");
	        dispatcher.forward(request, response);
	    }
	    else if("DisplayNotes".equals(action)) {

	    	request.setAttribute("notes", notes);

	    	request.setAttribute("etudiants", etudiants);
	    	request.setAttribute("modules", modules);
	    	request.setAttribute("matieres", matieres);
	    	request.setAttribute("matieresMap", matieresMap);

	        RequestDispatcher dispatcher = request.getRequestDispatcher("DisplayNotes.jsp");
	        dispatcher.forward(request, response);
	    	
	    }
	    else if ("triSpecialite".equals(action)) {
	        // Récupérer la spécialité sélectionnée pour le tri
	        String selectedSpecialite = request.getParameter("specialite");

	        // Filtrer les étudiants par spécialité
	        List<Etudiant> filteredEtudiantsBySpecialite = new ArrayList<>();
	        if (selectedSpecialite == null || selectedSpecialite.isEmpty()) {
	            filteredEtudiantsBySpecialite.addAll(etudiants);
	        } else {
	            for (Etudiant etudiant : etudiants) {
	                if (selectedSpecialite.equals(etudiant.getSpe())) {
	                    filteredEtudiantsBySpecialite.add(etudiant);
	                }
	            }
	        }

	        // Ajouter les étudiants triés par spécialité à la requête
	        request.setAttribute("etudiants", filteredEtudiantsBySpecialite);

	        // Mise à jour des autres attributs nécessaires
	        request.setAttribute("modules", modules);
	        request.setAttribute("matieres", matieres);
	        request.setAttribute("matieresMap", matieresMap);

	        // Dispatcher vers la page d'affichage des étudiants
	        RequestDispatcher dispatcher = request.getRequestDispatcher("AffichageStudent.jsp");
	        dispatcher.forward(request, response);
	    }

        response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         request.setAttribute("auth", auth);

		 String action = request.getParameter("action");

		    if ("connexion".equals(action)) {
		        // Authentification
		        String identifiant = request.getParameter("identifiant");
		        String motdepasse = request.getParameter("motdepasse");

		        for (Utilisateur utilisateur : utilisateurs) {
		            if (utilisateur.getIdentifiant().equals(identifiant) &&
		                utilisateur.getMotdepasse().equals(motdepasse)) {
		                // Authentification réussie
		                String type = utilisateur.getType();
		                if ("admin".equals(type)) {
		                    // Rediriger vers la page d'administration
		                    auth = 1;
		                    request.setAttribute("auth", auth);

		                    RequestDispatcher dispatcher = request.getRequestDispatcher("AdminPage.jsp");
		                    dispatcher.forward(request, response);
		                }
		                return;
		            }

		        }

		        
		        for (Etudiant etudiant : etudiants) {
		            if (etudiant.getIdentifiant().equals(identifiant) &&
		                etudiant.getMotdepasse().equals(motdepasse)) {
		                // Authentification réussie
		                String type = etudiant.getType();
		                if ("eleve".equals(type)) {
		                    // Récupérer les notes de l'étudiant
		                    List<Notes> notesEtudiant = notes.stream()
		                            .filter(note -> etudiant.getIne().equals(note.getINE()))
		                            .collect(Collectors.toList());

		                    // Ajouter les notes à la requête
		                    request.setAttribute("notesEtudiant", notesEtudiant);
		                    
		                    // Rediriger vers la page des élèves
		                    auth = 2;
		                    request.setAttribute("auth", auth);
		    		    	request.setAttribute("etudiants", etudiants);
				            request.setAttribute("modules", modules);

		                    RequestDispatcher dispatcher = request.getRequestDispatcher("ElevePage.jsp");
		                    dispatcher.forward(request, response);
		                }
		                return;
		            }
		            
		        }
		        RequestDispatcher dispatcher = request.getRequestDispatcher("test.jsp");
                dispatcher.forward(request, response);

		        // Authentification échouée
		        response.getWriter().println("<html><body>Identifiant ou mot de passe incorrect</body></html>");

		    } else if ("createUserPage".equals(action)) {
		    	RequestDispatcher dispatcher = request.getRequestDispatcher("FormCreateStudent.jsp");
                dispatcher.forward(request, response);
		}
		    else if("CreateStudent".equals(action)) {
		    	String nom = request.getParameter("nom");
		        String prenom = request.getParameter("prenom");
		        String INE = request.getParameter("INE");
		        String specialite = request.getParameter("specialite");
		        if (nom!= " " && prenom!="" && INE != "" && specialite !="" ) {
		        	etudiants.add(new Etudiant(nom, prenom, specialite, INE,prenom+"."+nom,specialite+nom , "eleve"));
		        	response.getWriter().println("<html><body>Etudiant ajouté</body></html>");
		        }
		    	
		    }
		    
		    else if ("AddNotePage".equals(action)) {		
		            // Récupérer la liste des modules
			    	// Before forwarding the request to FormulaireAddNotes.jsp
			    	request.setAttribute("etudiants", etudiants);
		            request.setAttribute("modules", modules);
		            RequestDispatcher dispatcher = request.getRequestDispatcher("FormulaireAddNotes.jsp");
		            dispatcher.forward(request, response);
		        }
		    else if("AddNote".equals(action)) {
		    	try {
	                int note = Integer.parseInt(request.getParameter("note"));
	                int module = Integer.parseInt(request.getParameter("module"));
	                int matiere = Integer.parseInt(request.getParameter("matiere"));
	                int semestre = Integer.parseInt(request.getParameter("semestre"));
	                String INE = request.getParameter("INE");

	                if (note >= 0  && semestre > 0) {
	                    notes.add(new Notes(note, module, matiere, semestre, INE));
	                    response.getWriter().println("<html><body>Note ajoutée</body></html>");
	                    request.setAttribute("notes", notes);
	                } else {
	                    response.getWriter().println("<html><body>Erreur : Vérifiez les valeurs saisies</body></html>");
	                }
	            } catch (NumberFormatException e) {
	                response.getWriter().println("<html><body>Erreur : La note ou le semestre doit être un nombre entier</body></html>");
	            }
		    	// Redirection vers la page d'affichage des notes
		    	
		    	// Avant de rediriger vers la JSP

		    	request.setAttribute("etudiants", etudiants);
		    	request.setAttribute("modules", modules);
		    	request.setAttribute("matieres", matieres);
		    	request.setAttribute("matieresMap", matieresMap);

		        RequestDispatcher dispatcher = request.getRequestDispatcher("DisplayNotes.jsp");
		        dispatcher.forward(request, response);
		    	
		    }
		 // Dans la méthode doPost de ServletCentrale
		    else if ("triModule".equals(action)) {
		        // Récupérer les paramètres de tri
		        String selectedModule = request.getParameter("module");
		        String sortDirection = request.getParameter("sort");
		        String sortSemestre = request.getParameter("sortSemestre");  // Nouveau paramètre de tri

		        // Filtrer les notes par module
		        List<Notes> filteredNotesByModule = new ArrayList<>();
		        if (selectedModule == null || selectedModule.isEmpty()) {
		            filteredNotesByModule.addAll(notes);
		        } else {
		            for (Notes note : notes) {
		                if (selectedModule.equals(String.valueOf(note.getModule()))) {
		                    filteredNotesByModule.add(note);
		                }
		            }
		        }

		        // Trier les notes (ajouter cette partie à votre logique de tri existante)
		        if ("asc".equals(sortDirection)) {
		            Collections.sort(filteredNotesByModule, Comparator.comparing(Notes::getValeur));
		        } else if ("desc".equals(sortDirection)) {
		            Collections.sort(filteredNotesByModule, Comparator.comparing(Notes::getValeur).reversed());
		        }

		        // Nouvelle logique de tri par semestre
		        if (sortSemestre != null && !sortSemestre.isEmpty()) {
		            int selectedSemestre = Integer.parseInt(sortSemestre);
		            filteredNotesByModule = filteredNotesByModule.stream()
		                    .filter(note -> note.getSemestre() == selectedSemestre)
		                    .collect(Collectors.toList());
		        }

		    	// Ajouter les notes triées à la requête
		    	request.setAttribute("notes", filteredNotesByModule);
		        // Mise à jour des attributs nécessaires
		        request.setAttribute("etudiants", etudiants);
		    	request.setAttribute("modules", modules);
		    	request.setAttribute("matieres", matieres);
		    	request.setAttribute("matieresMap", matieresMap);

		        request.setAttribute("notes", filteredNotesByModule);
		        setModulesAndMatieresAsAttributes(request);

		        // Dispatcher vers la page d'affichage des notes
		        RequestDispatcher dispatcher = request.getRequestDispatcher("DisplayNotes.jsp");
		        dispatcher.forward(request, response);
		    }
		    else if("addEvaluation".equals(action)) {
		    	
		    	RequestDispatcher dispatcher = request.getRequestDispatcher("FormulaireAddEvaluation.jsp");
	            dispatcher.forward(request, response);
		    }
		    
		    else if("Evaluate".equals(action)) {
		    	
		    	int qualisup = Integer.parseInt(request.getParameter("qualisup"));
                int qualieq = Integer.parseInt(request.getParameter("qualieq"));
                int travail = Integer.parseInt(request.getParameter("travail"));
                int module = Integer.parseInt(request.getParameter("module"));
                String com = request.getParameter("com");
                
                evaluations.add(new Evaluation(qualisup,qualieq,travail,com,module));
                
		    	RequestDispatcher dispatcher = request.getRequestDispatcher("ElevePage.jsp");
	            dispatcher.forward(request, response);
		    }
		    else if ("triModuleEval".equals(action)) {
		        // Récupérer les paramètres de tri
		        String selectedModule = request.getParameter("module");

		        // Filtrer les notes par module
		        List<Evaluation> filteredEvalByModule = new ArrayList<>();
		        if (selectedModule == null || selectedModule.isEmpty()) {
		        	filteredEvalByModule.addAll(evaluations);
		        } else {
		            for (Evaluation evaluation : evaluations) {
		                if (selectedModule.equals(String.valueOf(evaluation.getMod()))) {
		                	filteredEvalByModule.add(evaluation);
		                }
		            }
		        }
		        request.setAttribute("evaluations", filteredEvalByModule);

		        // Récupérer la liste des modules et la définir dans la requête
		        request.setAttribute("modules", modules);

		        RequestDispatcher dispatcher = request.getRequestDispatcher("AffichageEvaluation.jsp");
		        dispatcher.forward(request, response);
		    }
		    else if ("triModuleEl".equals(action)) {
		        // Récupérer les paramètres de tri
		        String selectedModule = request.getParameter("module");
		        String sortDirection = request.getParameter("sort");
		        String sortSemestre = request.getParameter("sortSemestre");  // Nouveau paramètre de tri

		        // Filtrer les notes par module
		        List<Notes> filteredNotesByModule = new ArrayList<>();
		        if (selectedModule == null || selectedModule.isEmpty()) {
		            filteredNotesByModule.addAll(notes);
		        } else {
		            for (Notes note : notes) {
		                if (selectedModule.equals(String.valueOf(note.getModule()))) {
		                    filteredNotesByModule.add(note);
		                }
		            }
		        }

		        // Trier les notes (ajouter cette partie à votre logique de tri existante)
		        if ("asc".equals(sortDirection)) {
		            Collections.sort(filteredNotesByModule, Comparator.comparing(Notes::getValeur));
		        } else if ("desc".equals(sortDirection)) {
		            Collections.sort(filteredNotesByModule, Comparator.comparing(Notes::getValeur).reversed());
		        }

		        // Nouvelle logique de tri par semestre
		        if (sortSemestre != null && !sortSemestre.isEmpty()) {
		            int selectedSemestre = Integer.parseInt(sortSemestre);
		            filteredNotesByModule = filteredNotesByModule.stream()
		                    .filter(note -> note.getSemestre() == selectedSemestre)
		                    .collect(Collectors.toList());
		        }

		    	// Ajouter les notes triées à la requête
		    	request.setAttribute("notes", filteredNotesByModule);
		        // Mise à jour des attributs nécessaires
		        request.setAttribute("etudiants", etudiants);
		    	request.setAttribute("modules", modules);
		    	request.setAttribute("matieres", matieres);
		    	request.setAttribute("matieresMap", matieresMap);

		        request.setAttribute("notes", filteredNotesByModule);
		    	request.setAttribute("notesEtudiant", filteredNotesByModule);

		        setModulesAndMatieresAsAttributes(request);

		        // Dispatcher vers la page d'affichage des notes
		        RequestDispatcher dispatcher = request.getRequestDispatcher("ElevePage.jsp");
		        dispatcher.forward(request, response);
		    }



	 }

}
