// Importer Application depuis Stimulus
import { Application } from "@hotwired/stimulus";
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";

// Créer l'instance de l'application Stimulus
const application = Application.start();

// Charger tous les contrôleurs de manière proactive à partir du répertoire "controllers"
eagerLoadControllersFrom("controllers", application);

// Si vous avez besoin d'un chargement paresseux, décommentez les lignes ci-dessous
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading";
// lazyLoadControllersFrom("controllers", application);

export { application };
