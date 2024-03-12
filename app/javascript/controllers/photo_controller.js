import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photo"
export default class extends Controller {
  static targets = ["form"]

  changePhoto() {
    this.formTarget.submit()
  }
}
