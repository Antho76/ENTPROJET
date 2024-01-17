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
import java.util.List;

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


    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCentrale() {
        super();
        // Ajoutez des utilisateurs de base
        utilisateurs.add(new Utilisateur("admin", "adminpass", "admin"));
        utilisateurs.add(new Utilisateur("eleve", "elevepass", "eleve"));
        etudiants.add(new Etudiant("Pain", "Anthonin", "maçonnerie", "0", "antho","pass", "etudiant" ));
        etudiants.add(new Etudiant("Didier","Deschamps","info","rffsj5","4","ea","eleve"));

        matieres.add(new Matiere(3, "Français"));
        matieres.add(new Matiere(4, "Anglais"));
        matieres.add(new Matiere(5, "Analyse"));
        matieres.add(new Matiere(6, "Algèbre"));
        matieres.add(new Matiere(7, "Langage C"));
        matieres.add(new Matiere(8, "BDD"));
        System.out.println("Taille de la liste matieres : " + matieres.size());

        
        // Ajouter des modules spécifiques avec les matières correspondantes
        modules.add(new Module(2, "Module Littéraire", new Matiere[]{matieres.get(0), matieres.get(1)}));
        modules.add(new Module(3, "Module Maths", new Matiere[]{matieres.get(2), matieres.get(3)}));
        modules.add(new Module(4, "Module Info", new Matiere[]{matieres.get(4), matieres.get(5)}));
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    /**
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	response.getWriter().println("<html><body>Bonjour tt le monde!!");
    	response.getWriter().println("<p>appel numero: " + (++nbappel) + "</p></body></html>");
    }
    */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if ("affichageStudent".equals(action)) {
			request.setAttribute("etudiants", etudiants);
			RequestDispatcher dispatcher = request.getRequestDispatcher("AffichageStudent.jsp");
	        dispatcher.forward(request, response);
		}
        response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		                    RequestDispatcher dispatcher = request.getRequestDispatcher("AdminPage.jsp");
		                    dispatcher.forward(request, response);
		                } else if ("eleve".equals(type)) {
		                    // Rediriger vers la page des élèves
		                    RequestDispatcher dispatcher = request.getRequestDispatcher("ElevePage.jsp");
		                    dispatcher.forward(request, response);
		                }
		                return;
		            }
		        }

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
		        	etudiants.add(new Etudiant(nom, prenom, specialite, INE,nom+"."+prenom,specialite+nom , "eleve"));
		        	response.getWriter().println("<html><body>Etudiant ajouté</body></html>");
		        }
		    	
		    }
		    
		    else if ("AddNotePage".equals(action)) {
		    	RequestDispatcher dispatcher = request.getRequestDispatcher("FormulaireAddNotes.jsp");
                dispatcher.forward(request, response);

	    }
		    else if("AddNote".equals(action)) {
		    	try {
	                int note = Integer.parseInt(request.getParameter("note"));
	                String module = request.getParameter("module");
	                int semestre = Integer.parseInt(request.getParameter("semestre"));
	                String INE = request.getParameter("INE");

	                if (note >= 0 && module != null && semestre > 0) {
	                    notes.add(new Notes(note, module, semestre, INE));
	                    response.getWriter().println("<html><body>Note ajoutée</body></html>");
	                    request.setAttribute("notes", notes);
	                } else {
	                    response.getWriter().println("<html><body>Erreur : Vérifiez les valeurs saisies</body></html>");
	                }
	            } catch (NumberFormatException e) {
	                response.getWriter().println("<html><body>Erreur : La note ou le semestre doit être un nombre entier</body></html>");
	            }
		    	// Redirection vers la page d'affichage des notes
                request.setAttribute("etudiants", etudiants);
                request.setAttribute("modules", modules);
                request.setAttribute("matiere", matieres);


		        RequestDispatcher dispatcher = request.getRequestDispatcher("DisplayNotes.jsp");
		        dispatcher.forward(request, response);
		    	
		    }
	 }

}
