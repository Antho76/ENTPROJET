

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
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCentrale() {
        super();
        // Ajoutez des utilisateurs de base
        utilisateurs.add(new Utilisateur("admin", "adminpass", "admin"));
        utilisateurs.add(new Utilisateur("eleve", "elevepass", "eleve"));
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
		        	etudiants.add(new Etudiant("nom", "prenom", "INE", "specialite","eleve", "elevepass", "eleve"));
		        	response.getWriter().println("<html><body>Etudiant ajouté</body></html>");
		        }
		    	
		    }
		    
		    else if ("AddNotePage".equals(action)) {
		    	RequestDispatcher dispatcher = request.getRequestDispatcher("FormulaireAddNotes.jsp");
                dispatcher.forward(request, response);

	    }
	 }

}
