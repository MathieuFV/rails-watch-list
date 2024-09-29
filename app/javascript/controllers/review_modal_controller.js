import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal"];

  connect() {
    console.log("Modal Controller successfully connected !")
  }

  // Méthode pour ouvrir la modale
  open() {
    console.log("Open method called");
    if (this.hasModalTarget) {
      console.log("Modal target exists");
      this.modalTarget.style.display = "block";
    } else {
      console.error("Modal target not found");
    }
  }

  // Méthode pour fermer la modale
  close() {
    console.log("Close method called");
    if (this.hasModalTarget) {
      this.modalTarget.style.display = "none";
    } else {
      console.error("Modal target not found");
    }
  }

  // Méthode pour fermer la modale en cliquant à l'extérieur
  closeOnClickOutside(event) {
    console.log("closeOnClickOutside method called");
    if (event.target === this.modalTarget) {
      this.close();
    }
  }
}
